Feature: Password Policy

  In order to have a secure website the password policy should be configured securely.

  @api @javascript
  Scenario: Check that the policies are available and enabled.
    Given I am logged in as a user named "amy_pwdpol" with the "administrator" role that doesn't force password change
    When I go to "/admin/config/people/password_policy/list"
    Then I should see "Australian Government ISM Policy (Strong)"
    And I should see "Australian Government ISM Policy (Weak)"
    And the checkbox named "enabled" in table row having id "Australian Government ISM Policy (Strong)" should be checked
    And the checkbox named "enabled" in table row having id "Australian Government ISM Policy (Weak)" should be checked

  @api @javascript
  Scenario: Check that the 'Strong' policy is configured as expected
    Given I am logged in as a user named "barry_pwdpol" with the "administrator" role that doesn't force password change
    When I go to "/admin/config/people/password_policy/list"
    And I click "edit" in the "Australian Government ISM Policy (Strong)" row
    Then the "authenticated user" checkbox should be checked
    And the "Content editor" checkbox should be checked
    And the "Content approver" checkbox should be checked
    And the "Site builder" checkbox should be checked
    And the "Site editor" checkbox should be checked
    And the "administrator" checkbox should be checked
    And the "expiration" field should contain "90"
    And the "warning" field should contain "7"
    And the "constraint_digit" field should contain ""
    And the "constraint_username" field should contain "1"
    And the "constraint_delay" field should contain "24"
    And the "constraint_length" field should contain "11"
    And the "constraint_punctuation" field should contain ""
    And the "constraint_uppercase" field should contain ""
    And the "constraint_digit_placement" field should contain ""
    And the "constraint_letter" field should contain "1"
    And the "constraint_lowercase" field should contain ""
    And the "constraint_history" field should contain "8"
    And the "constraint_alphanumeric" field should contain "1"
    And the "constraint_complexity" field should contain "3"


  @api @javascript
  Scenario: Check that the 'Weak' policy is configured as expected
    Given I am logged in as a user named "chris_pwdpol" with the "administrator" role that doesn't force password change
    When I go to "/admin/config/people/password_policy/list"
    And I click "edit" in the "Australian Government ISM Policy (Weak)" row
    Then the "authenticated user" checkbox should not be checked
    And the "Content editor" checkbox should not be checked
    And the "Content approver" checkbox should not be checked
    And the "Site builder" checkbox should not be checked
    And the "Site editor" checkbox should not be checked
    And the "administrator" checkbox should not be checked
    And the "expiration" field should contain "90"
    And the "warning" field should contain "7"
    And the "constraint_digit" field should contain ""
    And the "constraint_username" field should contain "1"
    And the "constraint_delay" field should contain "24"
    And the "constraint_length" field should contain "15"
    And the "constraint_punctuation" field should contain ""
    And the "constraint_uppercase" field should contain ""
    And the "constraint_digit_placement" field should contain ""
    And the "constraint_letter" field should contain "1"
    And the "constraint_lowercase" field should contain ""
    And the "constraint_history" field should contain "8"
    And the "constraint_alphanumeric" field should contain "1"
    And the "constraint_complexity" field should contain ""

  @api @javascript
  Scenario: Check that the ASD password warning is hidden.
    Given I am logged in as a user named "david_pwdpol" with the "administrator" role that doesn't force password change
    When I go to "admin/config/people/password_policy/govcms"
    Then the "edit-govcms-password-policy-ready" select list should be set to "1"
