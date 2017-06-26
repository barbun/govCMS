<?php

use Behat\Behat\Definition\Call\Given;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Drupal\DrupalExtension\Context\MinkContext;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Mink\Driver\Selenium2Driver;
use Behat\Behat\Hook\Scope\AfterStepScope;
use Behat\Mink\Element\Element;
use Drupal\DrupalExtension\Hook\Scope\EntityScope;
use Behat\Behat\Context\SnippetAcceptingContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Keep track of all users that are created so they can easily be removed.
   *
   * @var array
   */
  protected $userBeans = array();

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  /**
   * Set default browser window size to maximum.
   *
   * @BeforeScenario
   */
  public function maximizeWindow() {
    $driver = $this->getSession()->getDriver();
    if (!($driver instanceof Selenium2Driver)) {
      return;
    }
    $this->getSession()->getDriver()->maximizeWindow();
  }

  /**
   * Log the user IDs of the users that create beans.
   *
   * Collect user IDs later to be used for cleaning up the test beans.
   *
   * @afterUserCreate
   */
  public function logBeanUsers(EntityScope $scope) {
    // Retrieve the user.
    $user = $scope->getEntity();
    if (!empty($user->uid)) {
      $this->userBeans[$user->uid] = $user->uid;
    };
  }

  /**
   * Clean the password state tables for a test user to bypass password policy.
   *
   * Remove any password history, expiration of flag forcing a password change
   * when they next log in.
   *
   * @afterUserCreate
   */
  public function cleanUserPasswordState(EntityScope $scope) {
    // Retrieve the user.
    $user = $scope->getEntity();
    if (!empty($user->uid)) {
      // Remove the records from password policy module tables.
      db_delete('password_policy_force_change')
        ->condition('uid', $user->uid)
        ->execute();
      db_delete('password_policy_expiration')
        ->condition('uid', $user->uid)
        ->execute();
      db_delete('password_policy_history')
        ->condition('uid', $user->uid)
        ->execute();
    }
  }

  /**
   * Helper for creating users.
   *
   * @param string $name
   *   The name to use - random value created if blank.
   * @param string $pass
   *   The password to use - random value created if blank.
   * @param string $roles
   *   A comma delimited list of roles to add to the user.
   */
  private function createUser($name = '', $pass = '', $roles = '') {
    if (!$name) {
      $name = $this->getRandom()->name(8);
    }

    if (!$pass) {
      $pass = $this->getRandom()->name(16);
    }

    $user = (object) array(
      'name' => $name,
      'pass' => $pass,
      'mail' => "{$name}@example.com",
    );

    $this->userCreate($user);

    if (!empty($roles)) {
      $roles = explode(',', $roles);
      $roles = array_map('trim', $roles);
      foreach ($roles as $role) {
        if (!in_array(strtolower($role), [
          'authenticated',
          'authenticated user',
        ])
        ) {
          // Only add roles other than 'authenticated user'.
          $this->getDriver()->userAddRole($user, $role);
        }
      }
    }

    return $user;
  }

  /**
   * Retrieve a table row(s) containing specified element id|name|label|value.
   *
   * @param \Behat\Mink\Element\Element $element
   *   The page object to search within.
   * @param string $rowElement
   *   The text to search for to identify the table row(s).
   *
   * @return \Behat\Mink\Element\NodeElement
   *   The table rows, if found.
   *
   * @throws \Exception
   *   When no such match is found.
   */
  public function getTableRowWithElement(Element $element, $rowElement) {
    $rows = $element->findAll('css', sprintf('table tr:contains("%s")', $rowElement));
    if (empty($rows)) {
      throw new \Exception(sprintf('No rows containing the element with id|name|label|value "%s" found on the page %s', $rowElement, $this->getSession()->getCurrentUrl()));
    }

    return $rows;
  }

  /**
   * Creates and authenticates a user with a specific name and given role(s).
   *
   * @Given /^I am logged in as a user named "(?P<username>[^"]*)" with the "(?P<role>[^"]*)" role$/
   */
  public function assertAuthenticatedByRole($username, $role = '') {
    // Check if a user with this role is already logged in.
    if (!$this->loggedInWithRole($role)) {
      // Create user (and project)
      $user = $this->createUser($username, '', $role);

      // Login.
      $this->login();
    }
  }

  /**
   * Creates and authenticates a user with the given permission(s).
   *
   * @param string $permissions
   *   The comma separated list of permissions to provide to the user.
   * @param string $username
   *   Optional parameter for user name to be used for login.
   * @param string $password
   *   Optional parameter for user password to be used for login.
   *
   * @Given /^I am logged in as a user (?:|named )"(?P<username>[^"]*)" with the "(?P<permissions>[^"]*)" permission(?:|s)$/
   * @Given /^I am logged in as a user with the password "(?P<password>[^"]*)" and the "(?P<permissions>[^"]*)" permission(?:|s)$/
   */
  public function assertAuthenticatedWithPermissions($permissions, $username = '', $password = '') {
    // Create user.
    $user = $this->createUser($username, $password);

    // Create and assign a temporary role with given permissions.
    $permissions = explode(',', $permissions);
    $rid = $this->getDriver()->roleCreate($permissions);
    $this->getDriver()->userAddRole($user, $rid);
    $this->roles[] = $rid;

    // Login.
    $this->login();
  }

  /**
   * Creates and authenticates a user with the given set of permissions.
   *
   * @param \Behat\Gherkin\Node\PyStringNode $permissions
   *   The permissions to check for.
   * @param string $username
   *   The user name (a random one is chosen if not supplied).
   * @param string $password
   *   The initial password (a random one is chosen if not supplied).
   *
   * @Given /^I am logged in as a user (?:|named )(?:|"(?P<username>[^"]*)" )(?:|with the password "(?P<password>[^"]*)" )with the following permissions:$/
   */
  public function assertAuthenticatedWithPermissionsList(PyStringNode $permissions, $username = '', $password = '') {
    // Create user.
    $user = $this->createUser($username, $password);

    // Create and assign a temporary role with given permissions.
    // The table parsing might have left whitespace around the text => trim.
    $perms_array = array();
    foreach ($permissions->getStrings() as $permission) {
      array_push($perms_array, trim($permission));
    }
    $rid = $this->getDriver()->roleCreate($perms_array);
    $this->getDriver()->userAddRole($user, $rid);
    $this->roles[] = $rid;

    // Find the user.
    $account = user_load_by_name($user->name);

    // Login.
    $this->login();
  }

  /**
   * Log out a user.
   *
   * @Then /^I logout$/
   */
  public function assertLogout() {
    $this->logout();
  }

  /**
   * Check that a user account with a particular name and role exists.
   *
   * @Given /^a user named "(?P<username>[^"]*)" with role "(?P<role>[^"]*)" exists$/
   */
  public function assertAccountCreated($username, $role) {
    if (!user_load_by_name($username)) {
      $user = $this->createUser($username, '', $role);
    }
  }

  /**
   * Ensure that a user account is deleted.
   *
   * @When /^a user named "(?P<username>[^"]*)" is deleted$/
   */
  public function assertAccountDeleted($username) {
    // Find the user.
    $user = user_load_by_name($username);
    // If such user exists then delete it.
    if (!empty($user)) {
      $this->getDriver()->userDelete($user);
    }
    else {
      throw new \Exception('No such user');
    }
  }

  /**
   * Access the user edit page.
   *
   * @Given /^I visit the user edit page for "(?P<username>[^"]*)"$/
   */
  public function iVisitTheUserEditPageFor($username) {
    $account = user_load_by_name($username);
    if (!empty($account->uid)) {
      $this->getSession()->visit($this->locatePath('/user/' . $account->uid . '/edit'));
    }
    else {
      throw new \Exception('No such user');
    }
  }

  /**
   * Check that the roles for a user can be modified.
   *
   * @Then /^I should be able to change the "(?P<role_name>[^"]*)" role$/
   */
  public function iShouldBeAbleToChangeTheRole($role_name) {
    $administrator_role = user_role_load_by_name($role_name);
    $this->assertSession()->elementExists('css', '#edit-roles-change-' . $administrator_role->rid);
  }

  /**
   * Check that the roles for a user may not be modified.
   *
   * @Then /^I should not be able to change the "(?P<role_name>[^"]*)" role$/
   */
  public function iShouldNotBeAbleToChangeTheRole($role_name) {
    $administrator_role = user_role_load_by_name($role_name);
    $this->assertSession()->elementNotExists('css', '#edit-roles-change-' . $administrator_role->rid);
  }

  /**
   * Check that a particular option on a select list is selected.
   *
   * @Then the :arg1 select list should be set to :arg2
   */
  public function theSelectListShouldBeSetTo($arg1, $arg2) {
    try {
      $select = $this->getSession()->getPage()->find('css', '#' . $arg1);
    }
    catch (Exception $e) {
      throw new \Exception(sprintf("No select list with id '%s' found on the page '%s'.", $arg1, $this->getSession()->getCurrentUrl()));
    }
    if ($select->getValue() != $arg2) {
      throw new \Exception(sprintf("Select list with id '%s' was found but not set to value '%s'.", $arg1, $arg2));
    }
  }

  /**
   * Checks that a checkbox in a row containing specific text is ticked.
   *
   * Lets you provide a piece of text to use in locating a table row and another
   * piece of text to find a checkbox within that row, then test whether the
   * checkbox is ticked. The use of text avoids reliance on a table having
   * particular content order and makes the test much more readable:
   *
   * "And the checkbox named "enabled" in table row with text "Australian
   * Government ISM Policy (Strong)" should be checked".
   *
   * @param string $rowMatch
   *   The text to match in searching for a table row.
   * @param string $textMatch
   *   The pattern to use in searching for the checkbox (eg. enabled)
   *
   * @Then the checkbox named :rowMatch in table row with text :textMatch should be checked
   */
  public function theCheckboxNamedInTableRowWithTextShouldBeChecked($rowMatch, $textMatch) {
    // Find the table rows containing $rowMatch.
    $rows = $this->getTableRowWithElement($this->getSession()->getPage(), $textMatch);
    // Loop through all found rows and try to find our element.
    foreach ($rows as $row) {
      $checkbox = $row->find('css', sprintf('[id*="%s"]', $rowMatch));
      if (empty($checkbox)) {
        throw new \Exception(sprintf('No checkbox named "%s" found in the table row with text "%s"', $rowMatch, $textMatch, $this->getSession()->getCurrentUrl()));
      }
      if (!$checkbox->isChecked()) {
        throw new \Exception(sprintf("Checkbox with id '%s' in a row containing '%s' was found but was not checked.", $textMatch, $rowMatch));
      }
    }
  }

  /**
   * Checks that a checkbox in a row containing some text is NOT ticked.
   *
   * @param string $rowMatch
   *   The text to match in searching for a table row.
   * @param string $textMatch
   *   The pattern to use in searching for the checkbox (eg. enabled)
   *
   * @Then the checkbox named :rowMatch in table row with text :textMatch should not be checked
   */
  public function theCheckboxNamedInTableRowWithTextShouldBeNotChecked($rowMatch, $textMatch) {
    // Find the table rows containing $rowMatch.
    $rows = $this->getTableRowWithElement($this->getSession()->getPage(), $textMatch);
    // Loop through all found rows and try to find our element.
    foreach ($rows as $row) {
      $checkbox = $row->find('css', sprintf('[id*="%s"]', $rowMatch));
      if (empty($checkbox)) {
        throw new \Exception(sprintf('No checkbox named "%s" found in the table row with text "%s"', $rowMatch, $textMatch, $this->getSession()->getCurrentUrl()));
      }
      if ($checkbox->isChecked()) {
        throw new \Exception(sprintf("Checkbox with id '%s' in a row containing '%s' was found but was checked.", $textMatch, $rowMatch));
      }
    }
  }

  /**
   * Sets an id for the first iframe situated in the element specified by id.
   *
   * Needed when wanting to fill in WYSIWYG editor situated in an iframe without
   * identifier.
   *
   * @Given /^the iframe in element "(?P<element>[^"]*)" has id "(?P<id>[^"]*)"$/
   */
  public function theIframeInElementHasId($element_id, $iframe_id) {
    $function = <<<JS
(function(){
  var elem = document.getElementById("$element_id");
  var iframes = elem.getElementsByTagName('iframe');
  var f = iframes[0];
  f.id = "$iframe_id";
})()
JS;
    try {
      $this->getSession()->executeScript($function);
    }
    catch (Exception $e) {
      throw new \Exception(sprintf('No iframe found in the element "%s" on the page "%s".', $element_id, $this->getSession()->getCurrentUrl()));
    }
  }

  /**
   * Select a radio button using an optional label and an id.
   *
   * @When I select the radio button :label with the id containing :id
   * @When I select the radio button with the id containing :id
   */
  public function assertSelectRadioByPartialId($id, $label = '') {
    // Locate radio buttons on the page, matching the label if provided.
    $page = $this->getSession()->getPage();
    $radiobuttons = $page->findAll('named', array('radio', $label));

    if (!$radiobuttons) {
      throw new \Exception(sprintf('The radio button with "%s" was not found on the page %s', $id, $this->getSession()->getCurrentUrl()));
    }

    // Check the ids of the buttons until we find the first match.
    foreach ($radiobuttons as $radiobutton) {

      $buttonId = $radiobutton->getAttribute('id');
      if (strpos($buttonId, $id) === FALSE) {
        continue;
      }

      $value = $radiobutton->getAttribute('value');
      $radiobutton->selectOption($value, FALSE);
      return;
    }

    // No match? It's a fail.
    throw new \Exception(sprintf('The radio button with id "%s" and label "%s" was not found on the page %s',
      $id, $label, $this->getSession()->getCurrentUrl()));
  }

  /**
   * Test whether a user account can be blocked.
   *
   * @Given /^I should be able to block the user$/
   */
  public function iShouldBeAbleToBlockTheUser() {
    $this->assertSession()->elementExists('css', 'input[name=status]');
  }

  /**
   * Confirm that a user account may not be blocked.
   *
   * @Given /^I should not be able to block the user$/
   */
  public function iShouldNotBeAbleToBlockTheUser() {
    $this->assertSession()->elementNotExists('css', 'input[name=status]');
  }

  /**
   * Test visiting an account cancel page.
   *
   * @Given /^I visit the user cancel page for "(?P<username>[^"]*)"$/
   */
  public function iShouldNotBeAbleToCancelTheAccount($username) {
    $account = user_load_by_name($username);
    return new Given('I visit "/user/' . $account->uid . '/cancel"', function () {
    });
  }

  /**
   * Test that an account can be cancelled.
   *
   * @Then /^I should be able to cancel the account "(?P<username>[^"]*)"$/
   */
  public function iShouldBeAbleToCancelTheAccount($username) {
    $this->selectUserVBOCheckbox($username);
    $this->getSession()->getPage()->fillField('operation', 'action::views_bulk_operations_user_cancel_action');
    $this->getSession()->getPage()->pressButton('edit-submit--2');
    $this->assertSession()->elementExists('css', 'input[value=Next][type=submit]');
    return new Given('I should not see "is protected from cancellation, and was not cancelled."');
  }

  /**
   * Converts a role name to an rid if required.
   *
   * @param mixed $rid
   *   The role ID or name.
   *
   * @return int
   *   The role ID
   */
  private function roleToRid($rid) {
    if (is_numeric($rid)) {
      return $rid;
    }

    return array_search($rid, user_roles());
  }

  /**
   * Asserts that a role has a set of permissions.
   *
   * @param string $rid
   *   The role ID.
   * @param \Behat\Gherkin\Node\PyStringNode $permissions
   *   The permissions to check for.
   *
   * @Then the :role role should have permissions:
   * @Then the :role role should have permission to:
   */
  public function assertPermissions($rid, PyStringNode $permissions) {
    $rid = self::roleToRid($rid);
    foreach ($permissions->getStrings() as $permission) {
      $this->assertPermission($rid, trim($permission), TRUE);
    }
  }

  /**
   * Asserts that a role does NOT have a set of permissions.
   *
   * @param string $rid
   *   The role ID.
   * @param \Behat\Gherkin\Node\PyStringNode $permissions
   *   The permissions to check for.
   *
   * @Then the :role role should not have permissions:
   * @Then the :role role should not have permission to:
   */
  public function assertNoPermissions($rid, PyStringNode $permissions) {
    $rid = self::roleToRid($rid);
    foreach ($permissions->getStrings() as $permission) {
      $this->assertNoPermission($rid, trim($permission), TRUE);
    }
  }

  /**
   * Asserts that a role has a specific permission.
   *
   * @param string $rid
   *   The role ID.
   * @param string $permission
   *   The permission to check for.
   * @param bool $assertPath
   *   Whether we should check the path.
   *
   * @Given the :role role has the :permission permission
   * @Given the :role role has permission to :permission
   *
   * @Then the :role role should have the :permission permission
   * @Then the :role role should have permission to :permission
   */
  public function assertPermission($rid, $permission, $assertPath = TRUE) {
    $rid = self::roleToRid($rid);
    if ($assertPath) {
      $mink = new MinkContext();
      $mink->setMink($this->getMink());
      $mink->assertAtPath('/admin/people/permissions/' . $rid);
    }
    $this->assertSession()->checkboxChecked($rid . '[' . $permission . ']');
  }

  /**
   * Asserts that a role does not have a specific permission.
   *
   * @param string $rid
   *   The role ID.
   * @param string $permission
   *   The permission to check for.
   * @param bool $assertPath
   *   Whether we should check the path.
   *
   * @Given the :role role does not have the :permission permission
   * @Given the :role role does not have permission to :permission
   *
   * @Then the :role role should not have the :permission permission
   * @Then the :role role should not have permission to :permission
   */
  public function assertNoPermission($rid, $permission, $assertPath = TRUE) {
    $rid = self::roleToRid($rid);
    if ($assertPath) {
      $mink = new MinkContext();
      $mink->setMink($this->getMink());
      $mink->assertAtPath('/admin/people/permissions/' . $rid);
    }
    $field = $rid . '[' . $permission . ']';
    try {
      $this->assertSession()->fieldNotExists($field);
    }
    catch (Exception $e) {
      $this->assertSession()->checkboxNotChecked($field);
    }
  }

  /**
   * Actions to take after a step has run.
   *
   * @AfterStep
   */
  public function takeScreenShotAfterFailedStep(AfterStepScope $scope) {
    if (99 === $scope->getTestResult()->getResultCode()) {
      $driver = $this->getSession()->getDriver();
      if (!($driver instanceof Selenium2Driver)) {
        return;
      }
      $this->getSession()->resizeWindow(1440, 900, 'current');
      file_put_contents(__DIR__ . '../../../screenshot-fail.png', $this->getSession()->getDriver()->getScreenshot());
    }
  }

  /**
   * Selects a user in the VBO list.
   *
   * @param string $username
   *   The username to select.
   *
   * @throws \InvalidArgumentException
   *   When no such username exists or the checkbox can't be found.
   */
  protected function selectUserVBOCheckbox($username) {
    if ($account = user_load_by_name($username)) {
      if ($checkbox = $this->getSession()->getPage()->find('css', 'input[value=' . $account->uid . ']')) {
        $checkbox->check();
      }
      else {
        throw new \InvalidArgumentException(sprintf('No such checkbox %s', $username));
      }
    }
    else {
      throw new \InvalidArgumentException(sprintf('No such username %s', $username));
    }
  }

  /**
   * Takes a screenshot for debugging purposes.
   *
   * @param string $filename
   *   The name of the screenshot file.
   *
   * @When I take a screenshot named :filename
   */
  public function takeScreenshot($filename) {
    $screenshot = $this->getSession()->getDriver()->getScreenshot();
    // If this file is in tests/features/bootstrap, the screenshot be in tests.
    file_put_contents(__DIR__ . '../../' . $filename . '.png', $screenshot);
  }

  /**
   * Find an element in the table rows containing given element.
   *
   * @Then I should see (the text ):findElement in a table row containing (the text ):rowElement
   */
  public function assertTextInTableRowWithElement($findText, $rowElement) {
    $rows = $this->getTableRowWithElement($this->getSession()->getPage(), $rowElement);
    // Loop through all found rows and try to find our element.
    foreach ($rows as $row) {
      if (strpos($row->getText(), $findText) !== FALSE) {
        return TRUE;
      }
    }
    throw new \Exception(sprintf('Failed to find a row with the element "%s" that also contains "%s" on the page %s', $rowElement, $findText, $this->getSession()->getCurrentUrl()));
  }

  /**
   * Clean up bean entities that were created during the tests.
   *
   * @AfterScenario @beans
   */
  public function cleanUpBeans() {
    // Get UIDs of users created during this scenario.
    if (!empty($this->userBeans)) {
      // Select all beans created by the scenario users.
      $query = new EntityFieldQuery();
      $result = $query->entityCondition('entity_type', 'bean')
        ->propertyCondition('uid', $this->userBeans, 'IN')
        ->execute();
      // Loop through all beans that were found and delete them.
      if (isset($result['bean'])) {
        $bids = array_keys($result['bean']);
        foreach ($bids as $bid) {
          $bean = bean_load($bid);
          bean_delete($bean);
        }
      }
    }
    // Reset the list.
    $this->userBeans = array();
  }

}
