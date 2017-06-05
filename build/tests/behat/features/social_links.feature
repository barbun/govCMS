Feature:Social Media Links

  As a site builder
  I want to have a configurable block provided
  So that minimal configuration for social media links is required out of the box

  @api @javascript @wip
  Scenario: The social media links block should be available OOTB
    Given I am logged in as "John" with the "Site Editor" role that doesn't force a password change
    When I visit /admin/structure/block
    Then I can see a "Social Links" block available
    And when I edit that block
    And I fill in the values (add
  {test value} to one of the links?)
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
