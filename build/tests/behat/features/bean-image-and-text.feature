Feature: Image and Text bean

  Ensure that Image and Text bean type is available and displayed as expected

  @api @javascript @drupal @beans
  Scenario: Create, view and edit a new Image and Text bean
    Given I am logged in as a user with the "create any image_and_text bean,view bean page,access media browser,create files,bypass file access" permission and don't need a password change
    When I go to "/block/add/image-and-text"
    Then I should see "Create Image and Text block"
    And I fill in the following:
      | Label | Cool beans             |
      | Title | Beans are good for you |
    Given I click "Browse"
    Then I switch to an iframe "mediaBrowser"
    And I attach the file "test.jpg" to "files[upload]"
    And I press "Next"
    Then I select the radio button "Public local files served by the webserver."
    And I press "Next"
    And I enter "Behold, a generic logo" for "Name"
    And I press "Save"
    Given I switch back from an iframe
    And I wait for AJAX to finish
    Then I should see a "[name=field_bean_image_und_0_remove_button]" element
    Given the iframe in element "cke_edit-field-bean-text-und-0-value" has id "bean-body-wysiwyg"
    And I fill in "govCMS is the best!" in WYSIWYG editor "bean-body-wysiwyg"
    And I press "Save"
    Then I should see the success message containing "Image and Text Beans are good for you has been created."
    Given I am logged in as a user with the "edit any image_and_text bean,view bean page,administer blocks,edit bean view mode" permission and don't need a password change
    When I go to "/admin/structure/block/manage/bean/cool-beans/configure"
    And I select "Second sidebar" from "govCMS (Barton) (default theme)"
    And I press "Save block"
    Then I should see the success message "The block configuration has been saved."
    And I go to homepage
    Then I should see the heading "Beans are good for you" in the "sidebar_second" region
    And the "#block-bean-cool-beans" element should contain "/image_and_text_bean_small/public/test.jpg"
    And I should see "govCMS is the best!"
    And I should see a ".entity.default" element
    When I go to "/block/cool-beans/edit"
    Then I should see the heading "Edit Image and Text: Cool beans"
    And for "URL" I enter "www.govcms.gov.au"
    And I take a screenshot named "test"
    And I select "Highlight" from "View Mode"
    And I press "Save"
    Then I should see the success message containing "Image and Text Beans are good for you has been updated."
    Given I am on homepage
    Then I should see the heading "Beans are good for you" in the "sidebar_second" region
    And the response should contain "<h2><a href=\"http://www.govcms.gov.au\">Beans are good for you</a></h2>"
    And the "#block-bean-cool-beans" element should contain "/image_and_text_bean_large/public/test.jpg"
    And I should see "govCMS is the best!"
    And I should see a ".entity.highlight" element
