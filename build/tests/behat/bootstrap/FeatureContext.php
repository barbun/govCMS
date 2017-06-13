<?php

use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Behat\Definition\Call\Given;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Mink\Driver\Selenium2Driver;
use Behat\Behat\Hook\Scope\AfterStepScope;
use Behat\Mink\Element\Element;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

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
   * @BeforeScenario @drupal
   */
  public function maximizeWindow() {
    $this->getSession()->getDriver()->maximizeWindow();
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
   * Creates and authenticates a user with the given role.
   *
   * @Given /^I am logged in as a user (?:|named "(?P<username>[^"]*)" )with the "(?P<role>[^"]*)" role that doesn't force password change$/
   */
  public function assertAuthenticatedByRole($username, $role) {
    // Check if a user with this role is already logged in.
    if (!$this->loggedInWithRole($role)) {
      // Create user (and project)
      $user = (object) array(
        'name' => !empty($username) ? $username : $this->getRandom()->name(8),
        'pass' => $this->getRandom()->name(16),
        'role' => $role,
      );
      $user->mail = "{$user->name}@example.com";

      $this->userCreate($user);

      $roles = explode(',', $role);
      $roles = array_map('trim', $roles);
      foreach ($roles as $role) {
        if (!in_array(strtolower($role), array('authenticated', 'authenticated user'))) {
          // Only add roles other than 'authenticated user'.
          $this->getDriver()->userAddRole($user, $role);
        }
      }

      // Find the user.
      $account = user_load_by_name($user->name);

      // Remove the "Force password change on next login" record.
      db_delete('password_policy_force_change')
        ->condition('uid', $account->uid)
        ->execute();
      db_delete('password_policy_expiration')
        ->condition('uid', $account->uid)
        ->execute();

      // Login.
      $this->login();
    }
  }

  /**
   * Creates and authenticates a user with the given permission.
   *
   * @Given /^I am logged in as a user (?:|named )(?:|"(?P<username>[^"]*)" )with the "(?P<permissions>[^"]*)" permission and don't need a password change$/
   */
  public function assertAuthenticatedWithPermission($username, $permissions) {
    // Create user.
    $user = (object) array(
      'name' => !empty($username) ? $username : $this->getRandom()->name(8),
      'pass' => $this->getRandom()->name(16),
    );
    $user->mail = "{$user->name}@example.com";
    $this->userCreate($user);

    // Create and assign a temporary role with given permissions.
    $permissions = explode(',', $permissions);
    $rid = $this->getDriver()->roleCreate($permissions);
    $this->getDriver()->userAddRole($user, $rid);
    $this->roles[] = $rid;

    // Find the user.
    $account = user_load_by_name($user->name);

    // Remove the "Force password change on next login" record.
    db_delete('password_policy_force_change')
      ->condition('uid', $account->uid)
      ->execute();
    db_delete('password_policy_expiration')
      ->condition('uid', $account->uid)
      ->execute();

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
      $user = (object) array(
        'name' => $username,
        'pass' => $this->getRandom()->name(16),
        'role' => $role,
        'roles' => array($role),
      );
      $user->mail = "{$user->name}@example.com";
      // Create a new user.
      $this->userCreate($user);
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
   * Fills in WYSIWYG editor with specified id.
   *
   * @Given /^(?:|I )fill in "(?P<text>[^"]*)" in WYSIWYG editor "(?P<iframe>[^"]*)"$/
   */
  public function iFillInInWYSIWYGEditor($text, $iframe) {
    try {
      $this->getSession()->switchToIFrame($iframe);
    }
    catch (Exception $e) {
      throw new \Exception(sprintf("No iframe with id '%s' found on the page '%s'.", $iframe, $this->getSession()->getCurrentUrl()));
    }
    $this->getSession()->executeScript("document.body.innerHTML = '<p>" . $text . "</p>'");
    $this->getSession()->switchToIFrame();
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
   * Actions to take after a step has run.
   *
   * @AfterStep
   */
  public function takeScreenShotAfterFailedStep(afterStepScope $scope) {
    if (99 === $scope->getTestResult()->getResultCode()) {
      $driver = $this->getSession()->getDriver();
      if (!($driver instanceof Selenium2Driver)) {
        return;
      }
      $this->getSession()->resizeWindow(1440, 900, 'current');
      file_put_contents('./screenshot-fail.png', $this->getSession()->getDriver()->getScreenshot());
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

}
