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

  @api @javascript
  Scenario: Check that password changes are forced for first-time logins and not forced for any of the roles.
    Given I am logged in as a user named "esther_pwdpol" with the "administrator" role that doesn't force password change
    When I go to "admin/config/people/password_policy/password_change"
    Then the "edit-password-policy-new-login-change" checkbox should be checked
    And the "edit-password-policy-force-change-roles-2" checkbox should not be checked
    And the "edit-password-policy-force-change-roles-3" checkbox should not be checked
    And the "edit-password-policy-force-change-roles-4" checkbox should not be checked
    And the "edit-password-policy-force-change-roles-5" checkbox should not be checked
    And the "edit-password-policy-force-change-roles-6" checkbox should not be checked
    And the "edit-password-policy-force-change-roles-7" checkbox should not be checked

  @api @javascript @drupal
  Scenario: Check the password policies are actually applied
    Given I am logged in as a user named "fred_pwdpol" with the "administrator" role that doesn't force password change and the password "abc123^*"
    When I visit the user edit page for "fred_pwdpol"
    And I fill in "edit-current-pass" with "abc123^*"
    And I fill in "edit-pass-pass1" with "invalid"
    And I fill in "edit-pass-pass2" with "invalid"
    And I press "Save"
    Then I should see the error message containing "Your password has not met the following requirement(s)"
    And I fill in "edit-current-pass" with "abc123^*"
    And I fill in "edit-pass-pass1" with "abc123^*foobarBash"
    And I fill in "edit-pass-pass2" with "abc123^*foobarBash"
    And I press "Save"
    Then I should see the success message containing "The changes have been saved"
