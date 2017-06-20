Feature: Account suspension

  To maintain the security of the website, when a user hasn't logged in for 60 days, then their account should be
  suspended.

  @api @javascript
  Scenario: Check that a user account is blocked after 90 days but may be manually unblocked.
    Given I am logged in as a user "John" with the password "Abcd1234&*(" with the following permissions:
   """
   access administration pages
   administer users
   access user profiles
   """
    And I visit "/admin/people/create"
    And I fill in the following:
      | Username         | Fred             |
      | E-mail address   | fred@example.com |
      | Password         | Abcd1234&*(      |
      | Confirm password | Abcd1234&*(      |
    And I press "Create new account"
    And I logout
    And the last login time for "Fred" is "89 days ago"
    # And I run cron
    And I visit "/user/login"
    And I fill in the following:
      | Username | Fred         |
      | Password | Abcd1234&*(  |
    And I press "Log in"
    Then I should not see the error message "The username Fred has not been activated or is blocked."
    When I logout
    And the last login time for "Fred" is "91 days ago"
    And I run cron
    And I visit "/user/login"
    And I fill in the following:
      | Username | Fred         |
      | Password | Abcd1234&*(  |
    And I press "Log in"
    Then I should see the error message "The username Fred has not been activated or is blocked."
    When I fill in the following:
      | Username | John         |
      | Password | Abcd1234&*(  |
    And I press "Log in"
    And I visit "/users/Fred"
    And I click "Edit"
    And I select the radio button "Active"
    And I press "Save"
    And I logout
    And I run cron
    And I visit "/user/login"
    And I fill in the following:
      | Username | Fred         |
      | Password | Abcd1234&*(  |
    And I press "Log in"
    Then I should not see the error message "The username Fred has not been activated or is blocked."
