Feature: Iconomist

  So users can easily identify the site, as the administrator, I want to have iconomist support.

  @api @javascript @drupal
  Scenario: Check that iconomist options exist on the theme settings page.
    Given I am logged in as a user with the "administer theme settings" permission and don't need a password change
    When I go to "/admin/appearance/settings/govcms_barton"
    Then I should see "Iconomist settings"
    And I press "Add icon"
    And I wait for AJAX to finish
    Then I should see "Path to custom icon"
    And I fill in "profiles/govcms/modules/contrib/acquia_connector/acquia_agent/acquia.ico" for "edit-iconomist-icons-0-path"
    And I fill in "100" for "edit-iconomist-icons-0-width"
    And I fill in "200" for "edit-iconomist-icons-0-height"
    And I select the radio button "Icon" with the id "edit-iconomist-icons-0-rel-icon"
    And I press "Save configuration"
    Then the response should contain "acquia.ico\" type=\"image/vnd.microsoft.icon\" sizes=\"100x200\""
    And I press "Remove icon"
    And I press "Save configuration"
    Then the response should not contain "acquia.ico\" type=\"image/vnd.microsoft.icon\" sizes=\"100x200\""
