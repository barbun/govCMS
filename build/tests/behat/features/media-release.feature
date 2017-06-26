Feature: Media Release

  Ensure the Media Release content type was created during installation.

  @api @javascript
  Scenario: Check that the WYSIWYG editor is available.
    Given I am logged in as a user with the "Content editor" role
    When I visit "/node/add/media-release"
    Then CKEditor "edit-body-und-0-value" should exist

  @api @javascript
  Scenario: Create Media Release content and check how it's displayed.
    Given I am logged in as a user with the "administrator" role
    Given "tags" terms:
      | name   |
      | acquia |
    When I go to "/node/add/media-release"
    Then I should see "Create Media Release"
    And I fill in the following:
      | Title   | New release            |
      | Date    | 13/05/2017             |
      | Summary | We migrated to govCMS! |
    Then I set the chosen element "edit-field-tags-und" to "acquia"
    And I put "Digital transformation is real. GovCMS is the best!" into WYSIWYG "edit-body-und-0-value"
#    Given I attach the file "autotest.pdf" to "files[field_file_und_0]"
#    And I press "Upload"
#    And I wait for AJAX to finish
#    Then the "#edit-field-file" element should contain "Remove"
    When I open the "edit-field-image" media browser
    Then I attach the file "autotest.jpg" to "files[upload]"
    And I press "Next"
    Then I fill in "Auto Test" for "Name"
    And I fill in "govCMS test image" for "Alt Text"
    And I submit the media browser
    Then the "#edit-field-image" element should contain "Edit"
    And the "#edit-field-image" element should contain "Remove"
    Given I click "Publishing options"
    Then I select "Published" from "Moderation state"
    And I press "Save"
    Then I should see the success message containing "Media Release New release has been created."
    And I logout
    Given I am an anonymous user
    When I visit "/news-media/media-releases/new-release"
    Then I should see the heading "New release"
    And I should see "Digital transformation is real. GovCMS is the best!"
    And the ".field-name-field-tags" element should contain "<a href=\"/tags/acquia\""
    And I should see the link "acquia"

  @api @javascript
  Scenario: Check that moderation works.
    Given "media_release" content:
      | title         | author     | status | state |
      | Agency update | Joe Editor | 0      | draft |
    And I am logged in as a user with the "Content approver" role
    When I am on "/news-media/media-releases/agency-update"
    Then I select "Needs Review" from "Moderation state"
    And press "Apply"
    And I logout
    Given I am logged in as a user with the "Content approver" role
    When I am on "/news-media/media-releases/agency-update"
    Then I select "Published" from "Moderation state"
    And press "Apply"
    And I logout
    Given I am an anonymous user
    When I visit "/news-media/media-releases/agency-update"
    Then I should see the heading "Agency update"

  @api @javascript
  Scenario: Check that custom menu link can be created.
    Given "media_release" content:
      | title         | author     | status | state         |
      | Agency update | Joe Editor | 0      | needs_review     |
    And I am logged in as a user with the "administrator" role
    When I am on "/news-media/media-releases/agency-update"
    Then I click "Edit draft"
    And I click "Menu settings"
    And I check the box "Provide a menu link"
    Given I click "Publishing options"
    Then I select "Published" from "Moderation state"
    And I press "Save"
    When I am on homepage
    And the cache has been cleared
    Then I should see the link "Agency update" in the "navigation" region
