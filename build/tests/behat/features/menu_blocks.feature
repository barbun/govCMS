Feature:Menu blocks

  Given I am logged in as "Site Builder"
  When I navigate to the list of the blocks
  Then I can see the options for 3 default menu blocks

  @api @javascript @drupal
  Scenario: 3 default govCMS menu blocks appear in the list of menu blocks and are configured as expected.
    Given I am logged in as a user with the "administer blocks" permission and don't need a password change
    When I go to "/admin/structure/block"
    Then the response should contain "id=\"edit-blocks-menu-block-govcms-menu-block-sidebar-region\""
    And the response should contain "id=\"edit-blocks-menu-block-govcms-menu-block-main-menu-region\""
    And the response should contain "id=\"edit-blocks-menu-block-govcms-menu-block-footer-region\""
    When I go to "/admin/structure/block/manage/menu_block/govcms_menu_block-sidebar/configure"
    Then the "edit-title" field should contain ""
    And the "edit-regions-govcms-barton" select list should be set to "sidebar_second"
    And the radio button with id "edit-visibility-0" should be checked
    And the "edit-pages" field should contain ""
    When I click "Content types"
    Then the "edit-types-blog-article" checkbox should not be checked
    And the "edit-types-consultation" checkbox should not be checked
    And the "edit-types-event" checkbox should not be checked
    And the "edit-types-media-release" checkbox should not be checked
    And the "edit-types-news-article" checkbox should not be checked
    And the "edit-types-footer-teaser" checkbox should not be checked
    And the "edit-types-publication" checkbox should not be checked
    And the "edit-types-slide" checkbox should not be checked
    And the "edit-types-page" checkbox should not be checked
    And the "edit-types-webform" checkbox should not be checked
    When I click "Roles"
    Then the "edit-roles-1" checkbox should not be checked
    And the "edit-roles-2" checkbox should not be checked
    And the "edit-roles-3" checkbox should not be checked
    And the "edit-roles-4" checkbox should not be checked
    And the "edit-roles-5" checkbox should not be checked
    And the "edit-roles-6" checkbox should not be checked
    And the "edit-roles-7" checkbox should not be checked
    When I click "Users"
    Then the radio button with id "edit-custom-0" should be checked
    And the "edit-custom-0" checkbox should be checked
    When I go to "/admin/structure/block/manage/menu_block/govcms_menu_block-main-menu/configure"
    Then the "edit-title" field should contain ""
    And the "edit-regions-govcms-barton" select list should be set to "-1"
    And the radio button with id "edit-visibility-0" should be checked
    And the "edit-pages" field should contain ""
    When I click "Content types"
    Then the "edit-types-blog-article" checkbox should not be checked
    And the "edit-types-consultation" checkbox should not be checked
    And the "edit-types-event" checkbox should not be checked
    And the "edit-types-media-release" checkbox should not be checked
    And the "edit-types-news-article" checkbox should not be checked
    And the "edit-types-footer-teaser" checkbox should not be checked
    And the "edit-types-publication" checkbox should not be checked
    And the "edit-types-slide" checkbox should not be checked
    And the "edit-types-page" checkbox should not be checked
    And the "edit-types-webform" checkbox should not be checked
    When I click "Roles"
    Then the "edit-roles-1" checkbox should not be checked
    And the "edit-roles-2" checkbox should not be checked
    And the "edit-roles-3" checkbox should not be checked
    And the "edit-roles-4" checkbox should not be checked
    And the "edit-roles-5" checkbox should not be checked
    And the "edit-roles-6" checkbox should not be checked
    And the "edit-roles-7" checkbox should not be checked
    When I click "Users"
    Then the radio button with id "edit-custom-0" should be checked
    And the "edit-custom-0" checkbox should be checked
    When I go to "/admin/structure/block/manage/menu_block/govcms_menu_block-footer/configure"
    Then the "edit-title" field should contain ""
    And the "edit-regions-govcms-barton" select list should be set to "footer"
    And the radio button with id "edit-visibility-0" should be checked
    And the "edit-pages" field should contain ""
    When I click "Content types"
    Then the "edit-types-blog-article" checkbox should not be checked
    And the "edit-types-consultation" checkbox should not be checked
    And the "edit-types-event" checkbox should not be checked
    And the "edit-types-media-release" checkbox should not be checked
    And the "edit-types-news-article" checkbox should not be checked
    And the "edit-types-footer-teaser" checkbox should not be checked
    And the "edit-types-publication" checkbox should not be checked
    And the "edit-types-slide" checkbox should not be checked
    And the "edit-types-page" checkbox should not be checked
    And the "edit-types-webform" checkbox should not be checked
    When I click "Roles"
    Then the "edit-roles-1" checkbox should not be checked
    And the "edit-roles-2" checkbox should not be checked
    And the "edit-roles-3" checkbox should not be checked
    And the "edit-roles-4" checkbox should not be checked
    And the "edit-roles-5" checkbox should not be checked
    And the "edit-roles-6" checkbox should not be checked
    And the "edit-roles-7" checkbox should not be checked
    When I click "Users"
    Then the radio button with id "edit-custom-0" should be checked
    And the "edit-custom-0" checkbox should be checked
