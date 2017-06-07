Feature:Social Media Links

  As a site builder
  I want to have a configurable block provided
  So that minimal configuration for social media links is required out of the box

  @api @javascript @drupal
  Scenario: The social media links block should be available OOTB
    Given I am logged in as a user with the "administer blocks" permission and don't need a password change
    When I go to "/admin/structure/block"
    Then the "edit-blocks-govcms-social-links-services-region" select list should be set to "sidebar_second"
    When I follow "edit-blocks-govcms-social-links-services-configure"
    Then the "Block title" field should contain ""
    And the "Facebook URL" field should contain "https://www.facebook.com/"
    And the "Twitter URL" field should contain "https://twitter.com/"
    And the "Youtube URL" field should contain "https://www.youtube.com/user/"
    And the "Vimeo URL" field should contain "http://www.vimeo.com"
    And the "Flickr URL" field should contain "https://www.flickr.com/"
    And the "Instagram URL" field should contain "https://www.instagram.com/"
    And the "Linkedin URL" field should contain "https://www.linkedin.com/"
    And the "RSS Feed URL" field should contain "rss.xml"
    And the "Email URL" field should contain "contact"
    When for "Linkedin URL" I enter "http://example.com/nowhereinparticular"
    And I press "Save block"
    Then I should see "The block configuration has been saved."
    When I am on the homepage
    Then I should see the heading "Connect with us" in the "sidebar_second" region
    And the response should contain "http://example.com/nowhereinparticular"
    And I go to "/admin/structure/block/manage/govcms_social_links/services/configure"
    When for "Linkedin URL" I enter "https://www.linkedin.com/"
    And I press "Save block"
    Then I should see "The block configuration has been saved."
