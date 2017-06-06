Feature: Theme settings

  Ensure that only users with a permission have access to the theme's settings page.

  @drupal @api @javascript
  Scenario: Visit theme's settings page with the permission.
    Given I am logged in as a user with the "administer theme settings" permission and don't need a password change
    When I go to "/admin/appearance/settings"
    Then I should not see "You are not authorised to access this page."
    And I logout

  @drupal @api @javascript
  Scenario: Visit theme's settings page without the permission.
    Given I am logged in as a user with the "administer themes" permission and don't need a password change
    When I go to "/admin/appearance/settings"
    Then I should see "You are not authorized to access this page."
    And I logout
