<?php

use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Behat\Definition\Call\Given;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Mink\Driver\Selenium2Driver;
use Behat\Behat\Hook\Scope\AfterStepScope;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext
{

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
   * Creates and authenticates a user with the given role via Drush.
   *
   * @Given /^I am logged in as a user named "(?P<username>[^"]*)" with the "(?P<role>[^"]*)" role that doesn't force password change$/
   */
  public function assertAuthenticatedByRole($username, $role) {

    $user = (object)array(
      'name' => $username,
      'pass' => $this->getRandom()->name(16),
      'role' => $role,
      'roles' => array($role),
    );
    $user->mail = "{$user->name}@example.com";
    // Create a new user.
    $this->userCreate($user);

    // Find the user
    $account = user_load_by_name($user->name);

    // Remove the "Force password change on next login" record.
    db_delete('password_policy_force_change')
      ->condition('uid', $account->uid)
      ->execute();
    db_delete('password_policy_expiration')
      ->condition('uid', $account->uid)
      ->execute();

    $this->login();

  }

  /**
   * Creates and authenticates a user with the given permissions.
   *
   * @param string password
   *   The password to assign to the user being created.
   * @param string permissions
   *   A comma separated string containing permissions to be assigned to the user.
   *
   * @Given /^I am logged in with the password "(?P<password>[^"]*)" and the "(?P<role>[^"]*)" permissions$/
   */
  public function assertAuthenticatedWithPasswordAndPermission($password, $permissions) {

    $user = (object) array(
      'name' => $this->getRandom()->name(8),
      'pass' => $password,
    );
    $user->mail = "{$user->name}@example.com";
    // Create a new user.
    $this->userCreate($user);

    // Create and assign a temporary role with given permissions.
    $permissions = explode(',', $permissions);
    $rid = $this->getDriver()->roleCreate($permissions);
    $this->getDriver()->userAddRole($user, $rid);

    // Find the user.
    $account = user_load_by_name($user->name);

    // Remove the "Force password change on next login" record.
    db_delete('password_policy_force_change')
      ->condition('uid', $account->uid)
      ->execute();
    db_delete('password_policy_expiration')
      ->condition('uid', $account->uid)
      ->execute();
    db_delete('password_policy_history')
      ->condition('uid', $account->uid)
      ->execute();

    $this->login();

  }

  /**
   * Creates and authenticates a user with the given permission.
   *
   * @Given /^I am logged in as a user with the "(?P<permissions>[^"]*)" permission and don't need a password change$/
   */
  public function assertAuthenticatedWithPermission($permissions) {
    // Create user.
    $user = (object) array(
      'name' => $this->getRandom()->name(8),
      'pass' => $this->getRandom()->name(16),
    );
    $user->mail = "{$user->name}@example.com";
    $this->userCreate($user);

    // Create and assign a temporary role with given permissions.
    $permissions = explode(',', $permissions);
    $rid = $this->getDriver()->roleCreate($permissions);
    $this->getDriver()->userAddRole($user, $rid);
    $this->roles[] = $rid;

    // Find the user
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
   * @Then /^I logout$/
   */
  public function assertLogout() {
    $this->logout();
  }

  /**
   * @Given /^a user named "(?P<username>[^"]*)" with role "(?P<role>[^"]*)" exists$/
   */
  public function assertAccountCreated($username, $role) {
    if (!user_load_by_name($username)) {
      $user = (object)array(
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
   * @Given /^I visit the user edit page for "(?P<username>[^"]*)"$/
   */
  public function iVisitTheUserEditPageFor($username) {
    $account = user_load_by_name($username);
    if (!empty($account->uid)) {
      $this->getSession()->visit($this->locatePath('/user/' . $account->uid . '/edit'));
    } else {
      throw new \Exception('No such user');
    }
  }

  /**
   * @Then /^I should be able to change the "(?P<role_name>[^"]*)" role$/
   */
  public function iShouldBeAbleToChangeTheRole($role_name) {
    $administrator_role = user_role_load_by_name($role_name);
    $this->assertSession()->elementExists('css', '#edit-roles-change-' . $administrator_role->rid);
  }

  /**
   * @Then /^I should not be able to change the "(?P<role_name>[^"]*)" role$/
   */
  public function iShouldNotBeAbleToChangeTheRole($role_name) {
    $administrator_role = user_role_load_by_name($role_name);
    $this->assertSession()->elementNotExists('css', '#edit-roles-change-' . $administrator_role->rid);
  }

  /**
   * @Then the :arg1 select list should be set to :arg2;
   */
  public function theSelectListShouldBeSetTo($arg1, $arg2) {
    try {
      $select = $this->getSession()->getPage()->find('css', '#' . $arg1);
    } catch (Exception $e) {
      throw new \Exception(sprintf("No select list with id '%s' found on the page '%s'.", $arg1, $this->getSession()->getCurrentUrl()));
    }
    if ($select->getValue() != $arg2) {
      throw new \Exception(sprintf("Select list with id '%s' was found but not set to value '%s'.", $arg1, $arg2));
    }
  }

  /**
   * Checks that a checkbox in a row containing some text is ticked.
   *
   * Lets you provide a piece of text to use in locating a table row and another
   * piece of text to locate a checkbox within that row, then test whether the
   * checkbox is ticked. The use of text avoids reliance on a table having
   * particular content and ordering of that content and makes the test much
   * more readable:
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
    // Locate the table row containing $rowMatch.
    $row = $this->getSession()->getPage()->find('css', sprintf('table tr:contains("%s")', $textMatch));
    if (!$row) {
      throw new \Exception(sprintf("No table row with text '%s' found on the page '%s'.",
        $textMatch,
        $this->getSession()->getCurrentUrl()));
    }

    // There can be zero or more checkboxes. We take the first one (if any) that
    // matches $textMatch.
    $checkboxes = $row->findAll('css', "input[type=checkbox]");
    $found = FALSE;
    foreach ($checkboxes as $checkbox) {
      if (!((bool) preg_match('/' . preg_quote($rowMatch, '/') . '/ui', $checkbox->getAttribute('id')))) {
        continue;
      }
      if (!$checkbox->isChecked()) {
        throw new \Exception(sprintf("Checkbox with id '%s' in a row containing '%s' was found but was not checked.", $textMatch, $rowMatch));
      }

      $found = TRUE;
      break;
    }

    if (!$found) {
      throw new \Exception(sprintf("Checkbox with id '%s' was not found in a row matching '%s'.", $textMatch, $rowMatch));
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
    try {
      $row = $this->getSession()->getPage()->find('css', sprintf('table tr:contains("%s")', $textMatch));
    }
    catch (Exception $e) {
      throw new \Exception(sprintf("No table row with text '%s' found on the page '%s'.", $textMatch, $this->getSession()
        ->getCurrentUrl()));
    }

    // There can be zero or more checkboxes. We take the first one (if any) that
    // matches $textMatch.
    $checkboxes = $row->findAll('css', "input[type=checkbox]");
    $found = FALSE;
    foreach ($checkboxes as $checkbox) {
      if (!((bool) preg_match('/' . preg_quote($rowMatch, '/') . '/ui', $checkbox->getAttribute('id')))) {
        continue;
      }
      if ($checkbox->isChecked()) {
        throw new \Exception(sprintf("Checkbox with id '%s' in a row containing '%s' was found but was checked.", $textMatch, $rowMatch));
      }

      $found = TRUE;
      break;
    }

    if (!$found) {
      throw new \Exception(sprintf("Checkbox with id '%s' was not found in a row matching '%s'.", $textMatch, $rowMatch));
    }
  }

  /**
   * Sets an id for the first iframe situated in the element specified by id.
   * Needed when wanting to fill in WYSIWYG editor situated in an iframe without identifier.
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
    catch(Exception $e) {
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
   * @Given /^I should be able to block the user$/
   */
  public function iShouldBeAbleToBlockTheUser() {
    $this->assertSession()->elementExists('css', 'input[name=status]');
  }

  /**
   * @Given /^I should not be able to block the user$/
   */
  public function iShouldNotBeAbleToBlockTheUser() {
    $this->assertSession()->elementNotExists('css', 'input[name=status]');
  }


  /**
   * @Given /^I visit the user cancel page for "(?P<username>[^"]*)"$/
   */
  public function iShouldNotBeAbleToCancelTheAccount($username) {
    $account = user_load_by_name($username);
    return new Given('I visit "/user/' + $account->uid + '/cancel"', function () {
    });
  }

  /**
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
   * @AfterStep
   */
  public function takeScreenShotAfterFailedStep(afterStepScope $scope)
  {
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
   *
   * @throws \InvalidArgumentException
   *   When no such username exists or the checkbox can't be found.
   */
  protected function selectUserVBOCheckbox($username) {
    if ($account = user_load_by_name($username)) {
      if ($checkbox = $this->getSession()->getPage()->find('css', 'input[value=' . $account->uid . ']')) {
        $checkbox->check();
      } else {
        throw new \InvalidArgumentException(sprintf('No such checkbox %s', $username));
      }
    } else {
      throw new \InvalidArgumentException(sprintf('No such username %s', $username));
    }
  }

}
