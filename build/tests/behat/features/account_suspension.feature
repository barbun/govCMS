Feature: Account suspension

  To maintain the security of the website, when a user hasn't logged in for 60 days, then their account should be
  suspended.

  @api @javascript
  Scenario: Check that iconomist options exist on the theme settings page.
    Given I am logged in as a user with the "adminstrator" role:
    Given users:
      | name | mail             | roles          |
      | Fred | fred@example.com | Content editor |
    And the last login time for "Fred" is 59 days ago
    And I run cron
    Then the "Fred" account should not be blocked
    When the last login time for "Fred" is 60 days ago
    And the "Fred" account is unblocked
    And I run cron
    Then the "Fred" account should be blocked
    When I unblock the "Fred" account
    And I run cron
    Then the "Fred" account should be unblocked
