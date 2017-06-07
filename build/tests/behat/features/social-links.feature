Feature:Social Media Links

  As a site builder
  I want to have a configurable block provided
  So that minimal configuration for social media links is required out of the box

  @api @javascript @drupal @wip
  Scenario: The social media links block should be available OOTB
    Given I am logged in as a user with the "administer blocks" permission and don't need a password change
    When I visit /admin/structure/block
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
    When for "Email URL" I enter "https://nowhere.net"
    And I click "Save block"
    Then I should see "The block configuration has been saved."
    When I am on the homepage
    Then I should see the "Connect with us" block
    And I follow "edit-blocks-govcms-social-links-services-configure"
    Then the "Email URL" field should contain "https://nowhere.net"
    When for "Email URL" I enter "https://nowhere.net"
    And I click "Save block"
    When I click "Content types"
    Then the
    And I fill in the values (add {test value} to one of the links?)
    And I hit "Save block"
    Then I see "The block configuration has been saved."

  @api @javascript @wip
  Scenario: The social media links block should be configured with govCMS accounts by default
    Given I am logged in as "John" with the "Site Editor" role that doesn't force a password change
    When I visit /admin/structure/block/edit/
    And I fill in the values (add {test value} to one of the links?)
    And I hit "Save block"
    Then I see "The block configuration has been saved."

  @api @javascript @wip
  Scenario: The social media links block should appear on the front page and have the configured links
    Given I am logged in as "John" with the "Site Editor" role that doesn't force a password change
    And when I visit homepage
    And I can see the Connect with us block
    And within that block I can see a link
    And that link points to the {test value}
