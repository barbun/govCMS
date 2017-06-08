Feature: Permissions
  Check that permissions are as expected.

  @api @role @drupal @wip
  Scenario: Check anonymous user permissions
    Given I am logged in as a user with the "administer permissions" permission and don't need a password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "anonymous user" row
    Then the "anonymous user" role should have permission to:
      """
      access comments
      post comments
      """

    Then the "Administer theme settings" checkbox should not be checked
    And the "Administer block types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "Access the Bean overview page" checkbox should not be checked
    And the "Change the View Mode of the Bean" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "Basic content: Add Bean" checkbox should not be checked
    And the "Basic content: Edit Bean" checkbox should not be checked
    And the "Basic content: View Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should not be checked
    And the "Image and Text: Add Bean" checkbox should not be checked
    And the "Image and Text: Edit Bean" checkbox should not be checked
    And the "Image and Text: View Bean" checkbox should be checked
    And the "Image and Text: Delete Bean" checkbox should not be checked
    And the "Administer blocks" checkbox should not be checked
    And the "Administer comments and comment settings" checkbox should not be checked
    And the "View comments" checkbox should be checked
    And the "Post comments" checkbox should be checked
    And the "Skip comment approval" checkbox should not be checked
    And the "Edit own comments" checkbox should be checked
    And the "Administer contact forms and contact form settings" checkbox should not be checked
    And the "Use contextual links" checkbox should be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "Administer Display Suite" checkbox should not be checked
    And the "Access draggable views" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access control" checkbox should not be checked
    And the "Administer files" checkbox should not be checked
    And the "Use the Rich text text format" checkbox should not be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "Add media from remote services" checkbox should not be checked
    And the "Administer menus and menu items" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should not be checked
    And the "Bypass content access control" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And checkbox from xpath "//input[contains(@id, 'administer-nodes')]" should not be checked
    And the "Access the content overview page" checkbox should not be checked
    And the "View published content" checkbox should be checked
    And the "View own unpublished content" checkbox should not be checked
    And the "View content revisions" checkbox should not be checked
    And the "Revert content revisions" checkbox should not be checked
    And the "Webform: Create new content" checkbox should not be checked
    And the "Webform: Edit own content" checkbox should not be checked
    And the "Webform: Edit any content" checkbox should not be checked
    And the "Webform: Delete own content" checkbox should not be checked
    And the "Webform: Delete any content" checkbox should not be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "View administrative links on Panel panes" checkbox should not be checked
    And the "Configure access settings on Panel panes" checkbox should not be checked
    And the "Use the Panels In-Place Editor" checkbox should not be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should not be checked
    And the "Configure advanced settings on Panel panes" checkbox should not be checked
    And the "Configure caching settings on Panels" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should not be checked
    And the "Unlock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "Create and edit URL aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "Administer URL redirections" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "Schedule content publication" checkbox should not be checked
    And the "Override default scheduler time" checkbox should not be checked
    And the "Administer search" checkbox should not be checked
    And the "Use search" checkbox should be checked
    And the "Administer Search API" checkbox should not be checked
    And the "Access to Service Links" checkbox should be checked
    And the "Administer shield module" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "Edit current shortcut set" checkbox should not be checked
    And the "Select any shortcut set" checkbox should not be checked
    And the "View published site map" checkbox should be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "Use the administration pages and help" checkbox should not be checked
    And the "Use the site in maintenance mode" checkbox should not be checked
    And the "View the administration theme" checkbox should not be checked
    And the "View site reports" checkbox should not be checked
    And the "Administer vocabularies and terms" checkbox should not be checked
    And the "Edit terms in Tags" checkbox should not be checked
    And the "Delete terms from Tags" checkbox should not be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "View user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should not be checked
    And the "Administer views" checkbox should not be checked
    And the "Bypass views access control" checkbox should not be checked
    And the "Access all webform results" checkbox should not be checked
    And the "Access own webform results" checkbox should not be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should not be checked
    And the "Edit own webform submissions" checkbox should not be checked
    And the "Delete own webform submissions" checkbox should not be checked
    And the "Set Webform submission storage periods" checkbox should not be checked
    And the "View all unpublished content" checkbox should not be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "Bypass moderation restrictions" checkbox should not be checked
    And the "View moderation history" checkbox should not be checked
    And the "View the moderation messages on a node" checkbox should not be checked
    And the "Use \"My drafts\" workbench tab" checkbox should not be checked
    And the "Use \"Needs review\" workbench tab" checkbox should not be checked
    And the "Moderate all content from Draft to Needs Review" checkbox should not be checked
    And the "Moderate all content from Needs Review to Draft" checkbox should not be checked
    And the "Moderate all content from Needs Review to Published" checkbox should not be checked
    And the "Administer XML sitemap settings." checkbox should not be checked

  @api @role
  Scenario: Check authenticated user permissions
    Given I am logged in as a user named "betty_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "authenticated user" row
    Then the "Administer theme settings" checkbox should not be checked
    And the "Administer block types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "Access the Bean overview page" checkbox should not be checked
    And the "Change the View Mode of the Bean" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "Basic content: Add Bean" checkbox should not be checked
    And the "Basic content: Edit Bean" checkbox should not be checked
    And the "Basic content: View Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should not be checked
    And the "Image and Text: Add Bean" checkbox should not be checked
    And the "Image and Text: Edit Bean" checkbox should not be checked
    And the "Image and Text: View Bean" checkbox should be checked
    And the "Image and Text: Delete Bean" checkbox should not be checked
    And the "Administer blocks" checkbox should not be checked
    And the "Administer comments and comment settings" checkbox should not be checked
    And the "View comments" checkbox should be checked
    And the "Post comments" checkbox should be checked
    And the "Skip comment approval" checkbox should be checked
    And the "Edit own comments" checkbox should be checked
    And the "Administer contact forms and contact form settings" checkbox should not be checked
    And the "Use contextual links" checkbox should be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "Administer Display Suite" checkbox should not be checked
    And the "Access draggable views" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access control" checkbox should not be checked
    And the "Administer files" checkbox should not be checked
    And the "Use the Rich text text format" checkbox should be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "Add media from remote services" checkbox should not be checked
    And the "Administer menus and menu items" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should not be checked
    And the "Bypass content access control" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And checkbox from xpath "//input[contains(@id, 'administer-nodes')]" should not be checked
    And the "Access the content overview page" checkbox should not be checked
    And the "View published content" checkbox should be checked
    And the "View own unpublished content" checkbox should be checked
    And the "View content revisions" checkbox should not be checked
    And the "Revert content revisions" checkbox should not be checked
    And the "Webform: Create new content" checkbox should not be checked
    And the "Webform: Edit own content" checkbox should not be checked
    And the "Webform: Edit any content" checkbox should not be checked
    And the "Webform: Delete own content" checkbox should not be checked
    And the "Webform: Delete any content" checkbox should not be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "View administrative links on Panel panes" checkbox should not be checked
    And the "Configure access settings on Panel panes" checkbox should not be checked
    And the "Use the Panels In-Place Editor" checkbox should not be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should not be checked
    And the "Configure advanced settings on Panel panes" checkbox should not be checked
    And the "Configure caching settings on Panels" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should not be checked
    And the "Unlock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "Create and edit URL aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "Administer URL redirections" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "Schedule content publication" checkbox should not be checked
    And the "Override default scheduler time" checkbox should not be checked
    And the "Administer search" checkbox should not be checked
    And the "Use search" checkbox should be checked
    And the "Administer Search API" checkbox should not be checked
    And the "Access to Service Links" checkbox should be checked
    And the "Administer shield module" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "Edit current shortcut set" checkbox should not be checked
    And the "Select any shortcut set" checkbox should not be checked
    And the "View published site map" checkbox should be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "Use the administration pages and help" checkbox should not be checked
    And the "Use the site in maintenance mode" checkbox should not be checked
    And the "View the administration theme" checkbox should not be checked
    And the "View site reports" checkbox should not be checked
    And the "Administer vocabularies and terms" checkbox should not be checked
    And the "Edit terms in Tags" checkbox should not be checked
    And the "Delete terms from Tags" checkbox should not be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "View user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should not be checked
    And the "Administer views" checkbox should not be checked
    And the "Bypass views access control" checkbox should not be checked
    And the "Access all webform results" checkbox should not be checked
    And the "Access own webform results" checkbox should not be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should not be checked
    And the "Edit own webform submissions" checkbox should not be checked
    And the "Delete own webform submissions" checkbox should not be checked
    And the "Set Webform submission storage periods" checkbox should not be checked
    And the "View all unpublished content" checkbox should not be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "Bypass moderation restrictions" checkbox should not be checked
    And the "View moderation history" checkbox should not be checked
    And the "View the moderation messages on a node" checkbox should not be checked
    And the "Use \"My drafts\" workbench tab" checkbox should not be checked
    And the "Use \"Needs review\" workbench tab" checkbox should not be checked
    And the "Moderate all content from Draft to Needs Review" checkbox should not be checked
    And the "Moderate all content from Needs Review to Draft" checkbox should not be checked
    And the "Moderate all content from Needs Review to Published" checkbox should not be checked
    And the "Administer XML sitemap settings." checkbox should not be checked

  @api @role
  Scenario: Check Content editor user permissions
    Given I am logged in as a user named "christine_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Content editor" row
    Then the "Administer theme settings" checkbox should not be checked
    And the "Administer block types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "Access the Bean overview page" checkbox should not be checked
    And the "Change the View Mode of the Bean" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "Basic content: Add Bean" checkbox should be checked
    And the "Basic content: Edit Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "Image and Text: Add Bean" checkbox should be checked
    And the "Image and Text: Edit Bean" checkbox should be checked
    And the "Image and Text: Delete Bean" checkbox should be checked
    And the "Administer blocks" checkbox should not be checked
    And the "Administer comments and comment settings" checkbox should not be checked
    And the "Administer contact forms and contact form settings" checkbox should not be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "Administer Display Suite" checkbox should not be checked
    And the "Access draggable views" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access control" checkbox should not be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "Add media from remote services" checkbox should be checked
    And the "Administer menus and menu items" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass content access control" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And checkbox from xpath "//input[contains(@id, 'administer-nodes')]" should not be checked
    And the "Access the content overview page" checkbox should be checked
    And the "View content revisions" checkbox should be checked
    And the "Revert content revisions" checkbox should be checked
    And the "Webform: Create new content" checkbox should be checked
    And the "Webform: Edit own content" checkbox should not be checked
    And the "Webform: Edit any content" checkbox should be checked
    And the "Webform: Delete own content" checkbox should not be checked
    And the "Webform: Delete any content" checkbox should be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "View administrative links on Panel panes" checkbox should not be checked
    And the "Configure access settings on Panel panes" checkbox should not be checked
    And the "Use the Panels In-Place Editor" checkbox should not be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should not be checked
    And the "Configure advanced settings on Panel panes" checkbox should not be checked
    And the "Configure caching settings on Panels" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should not be checked
    And the "Unlock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "Create and edit URL aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "Administer URL redirections" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "Schedule content publication" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should not be checked
    And the "Administer Search API" checkbox should not be checked
    And the "Administer shield module" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "Edit current shortcut set" checkbox should not be checked
    And the "Select any shortcut set" checkbox should not be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "Use the administration pages and help" checkbox should be checked
    And the "Use the site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "View site reports" checkbox should not be checked
    And the "Administer vocabularies and terms" checkbox should not be checked
    And the "Edit terms in Tags" checkbox should not be checked
    And the "Delete terms from Tags" checkbox should not be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "View user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should not be checked
    And the "Bypass views access control" checkbox should not be checked
    And the "Access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "Set Webform submission storage periods" checkbox should not be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "Bypass moderation restrictions" checkbox should not be checked
    And the "View moderation history" checkbox should be checked
    And the "View the moderation messages on a node" checkbox should be checked
    And the "Use \"My drafts\" workbench tab" checkbox should be checked
    And the "Use \"Needs review\" workbench tab" checkbox should be checked
    And the "Moderate all content from Draft to Needs Review" checkbox should be checked
    And the "Moderate all content from Needs Review to Draft" checkbox should be checked
    And the "Moderate all content from Needs Review to Published" checkbox should not be checked
    And the "Administer XML sitemap settings." checkbox should not be checked

  @api @role
  Scenario: Check Content approver user permissions
    Given I am logged in as a user named "daniel_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Content approver" row
    Then the "Administer theme settings" checkbox should not be checked
    And the "Administer block types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "Access the Bean overview page" checkbox should not be checked
    And the "Change the View Mode of the Bean" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "Basic content: Add Bean" checkbox should be checked
    And the "Basic content: Edit Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "Image and Text: Add Bean" checkbox should be checked
    And the "Image and Text: Edit Bean" checkbox should be checked
    And the "Image and Text: Delete Bean" checkbox should be checked
    And the "Administer blocks" checkbox should not be checked
    And the "Administer comments and comment settings" checkbox should not be checked
    And the "Administer contact forms and contact form settings" checkbox should not be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "Administer Display Suite" checkbox should not be checked
    And the "Access draggable views" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access control" checkbox should not be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "Add media from remote services" checkbox should be checked
    And the "Administer menus and menu items" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass content access control" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And checkbox from xpath "//input[contains(@id, 'administer-nodes')]" should not be checked
    And the "Access the content overview page" checkbox should be checked
    And the "View content revisions" checkbox should be checked
    And the "Revert content revisions" checkbox should be checked
    And the "Webform: Create new content" checkbox should be checked
    And the "Webform: Edit own content" checkbox should not be checked
    And the "Webform: Edit any content" checkbox should be checked
    And the "Webform: Delete own content" checkbox should not be checked
    And the "Webform: Delete any content" checkbox should be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "View administrative links on Panel panes" checkbox should not be checked
    And the "Configure access settings on Panel panes" checkbox should not be checked
    And the "Use the Panels In-Place Editor" checkbox should not be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should not be checked
    And the "Configure advanced settings on Panel panes" checkbox should not be checked
    And the "Configure caching settings on Panels" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should not be checked
    And the "Unlock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "Create and edit URL aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "Administer URL redirections" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "Schedule content publication" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should not be checked
    And the "Administer Search API" checkbox should not be checked
    And the "Administer shield module" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "Edit current shortcut set" checkbox should not be checked
    And the "Select any shortcut set" checkbox should not be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "Use the administration pages and help" checkbox should be checked
    And the "Use the site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "View site reports" checkbox should not be checked
    And the "Administer vocabularies and terms" checkbox should not be checked
    And the "Edit terms in Tags" checkbox should not be checked
    And the "Delete terms from Tags" checkbox should not be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "View user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should not be checked
    And the "Bypass views access control" checkbox should not be checked
    And the "Access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "Set Webform submission storage periods" checkbox should not be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "Bypass moderation restrictions" checkbox should not be checked
    And the "View moderation history" checkbox should be checked
    And the "View the moderation messages on a node" checkbox should be checked
    And the "Use \"My drafts\" workbench tab" checkbox should be checked
    And the "Use \"Needs review\" workbench tab" checkbox should be checked
    And the "Moderate all content from Draft to Needs Review" checkbox should be checked
    And the "Moderate all content from Needs Review to Draft" checkbox should be checked
    And the "Moderate all content from Needs Review to Published" checkbox should be checked
    And the "Administer XML sitemap settings." checkbox should not be checked

  @api @role
  Scenario: Check Site Builder user permissions
    Given I am logged in as a user named "eric_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Site builder" row
    Then the "Administer theme settings" checkbox should be checked
    And the "Administer block types" checkbox should be checked
    And the "Administer beans" checkbox should be checked
    And the "Access the Bean overview page" checkbox should be checked
    And the "Change the View Mode of the Bean" checkbox should be checked
    And the "View Bean page" checkbox should be checked
    And the "Administer Bean Settings" checkbox should be checked
    And the "View Bean revisions" checkbox should be checked
    And the "Basic content: Add Bean" checkbox should be checked
    And the "Basic content: Edit Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "Image and Text: Add Bean" checkbox should be checked
    And the "Image and Text: Edit Bean" checkbox should be checked
    And the "Image and Text: Delete Bean" checkbox should be checked
    And the "Administer blocks" checkbox should be checked
    And the "Administer comments and comment settings" checkbox should not be checked
    And the "Administer contact forms and contact form settings" checkbox should be checked
    And the "Administer Crumbs" checkbox should be checked
    And the "Administer Display Suite" checkbox should be checked
    And the "Access draggable views" checkbox should be checked
    And the "Access event log" checkbox should be checked
    And the "Administer fields" checkbox should be checked
    And the "Bypass file access control" checkbox should be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should be checked
    And the "Administer image styles" checkbox should be checked
    And the "Access broken links report" checkbox should be checked
    And the "Access own broken links report" checkbox should be checked
    And the "Administer Maintenance Mode" checkbox should be checked
    And the "Add media from remote services" checkbox should not be checked
    And the "Administer menus and menu items" checkbox should be checked
    And the "Administer meta tags" checkbox should be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass content access control" checkbox should be checked
    And the "Administer content types" checkbox should be checked
    And checkbox from xpath "//input[contains(@id, 'administer-nodes')]" should be checked
    And the "Access the content overview page" checkbox should be checked
    And the "View content revisions" checkbox should be checked
    And the "Revert content revisions" checkbox should be checked
    And the "Webform: Create new content" checkbox should be checked
    And the "Webform: Edit own content" checkbox should not be checked
    And the "Webform: Edit any content" checkbox should be checked
    And the "Webform: Delete own content" checkbox should not be checked
    And the "Webform: Delete any content" checkbox should be checked
    And the "Use Page Manager" checkbox should be checked
    And the "Use Panels Dashboard" checkbox should be checked
    And the "View administrative links on Panel panes" checkbox should be checked
    And the "Configure access settings on Panel panes" checkbox should be checked
    And the "Use the Panels In-Place Editor" checkbox should be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should be checked
    And the "Configure advanced settings on Panel panes" checkbox should be checked
    And the "Configure caching settings on Panels" checkbox should be checked
    And the "Use panel locks" checkbox should be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should be checked
    And the "Unlock expired accounts" checkbox should be checked
    And the "Force password change" checkbox should be checked
    And the "Administer URL aliases" checkbox should be checked
    And the "Create and edit URL aliases" checkbox should be checked
    And the "Administer Quicktabs" checkbox should be checked
    And the "Administer URL redirections" checkbox should be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should be checked
    And the "Schedule content publication" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should be checked
    And the "Administer Search API" checkbox should be checked
    And the "Administer shield module" checkbox should be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "Edit current shortcut set" checkbox should not be checked
    And the "Select any shortcut set" checkbox should not be checked
    And the "Administer themes" checkbox should be checked
    And the "Administer actions" checkbox should be checked
    And the "Use the administration pages and help" checkbox should be checked
    And the "Use the site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "View site reports" checkbox should be checked
    And the "Administer vocabularies and terms" checkbox should be checked
    And the "Edit terms in Tags" checkbox should be checked
    And the "Delete terms from Tags" checkbox should be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer users" checkbox should be checked
    And the "View user profiles" checkbox should be checked
    And the "View User Actions" checkbox should be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should be checked
    And the "Bypass views access control" checkbox should be checked
    And the "Access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should be checked
    And the "Delete all webform submissions" checkbox should be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should not be checked
    And the "Delete own webform submissions" checkbox should not be checked
    And the "Set Webform submission storage periods" checkbox should be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should be checked
    And the "Bypass moderation restrictions" checkbox should be checked
    And the "View moderation history" checkbox should be checked
    And the "View the moderation messages on a node" checkbox should be checked
    And the "Use \"My drafts\" workbench tab" checkbox should be checked
    And the "Use \"Needs review\" workbench tab" checkbox should be checked
    And the "Moderate all content from Draft to Needs Review" checkbox should not be checked
    And the "Moderate all content from Needs Review to Draft" checkbox should not be checked
    And the "Moderate all content from Needs Review to Published" checkbox should not be checked
    And the "Administer XML sitemap settings." checkbox should be checked

  @api @role
  Scenario: Check Site editor user permissions
    Given I am logged in as a user named "fred_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Site editor" row
    Then the "Administer theme settings" checkbox should be checked
    And the "Administer block types" checkbox should not be checked
    And the "Administer beans" checkbox should be checked
    And the "Access the Bean overview page" checkbox should be checked
    And the "Change the View Mode of the Bean" checkbox should be checked
    And the "View Bean page" checkbox should be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should be checked
    And the "Basic content: Add Bean" checkbox should be checked
    And the "Basic content: Edit Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "Image and Text: Add Bean" checkbox should be checked
    And the "Image and Text: Edit Bean" checkbox should be checked
    And the "Image and Text: Delete Bean" checkbox should be checked
    And the "Administer blocks" checkbox should be checked
    And the "Administer comments and comment settings" checkbox should be checked
    And the "Administer contact forms and contact form settings" checkbox should be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "Administer Display Suite" checkbox should not be checked
    And the "Access draggable views" checkbox should be checked
    And the "Access event log" checkbox should be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access control" checkbox should be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should be checked
    And the "Access own broken links report" checkbox should be checked
    And the "Administer Maintenance Mode" checkbox should be checked
    And the "Add media from remote services" checkbox should be checked
    And the "Administer menus and menu items" checkbox should be checked
    And the "Administer meta tags" checkbox should be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass content access control" checkbox should be checked
    And the "Administer content types" checkbox should not be checked
    And checkbox from xpath "//input[contains(@id, 'administer-nodes')]" should be checked
    And the "Access the content overview page" checkbox should be checked
    And the "View content revisions" checkbox should be checked
    And the "Revert content revisions" checkbox should be checked
    And the "Webform: Create new content" checkbox should be checked
    And the "Webform: Edit own content" checkbox should not be checked
    And the "Webform: Edit any content" checkbox should be checked
    And the "Webform: Delete own content" checkbox should not be checked
    And the "Webform: Delete any content" checkbox should be checked
    And the "Use Page Manager" checkbox should be checked
    And the "Use Panels Dashboard" checkbox should be checked
    And the "View administrative links on Panel panes" checkbox should be checked
    And the "Configure access settings on Panel panes" checkbox should be checked
    And the "Use the Panels In-Place Editor" checkbox should be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should be checked
    And the "Configure advanced settings on Panel panes" checkbox should be checked
    And the "Configure caching settings on Panels" checkbox should be checked
    And the "Use panel locks" checkbox should be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should be checked
    And the "Unlock expired accounts" checkbox should be checked
    And the "Force password change" checkbox should be checked
    And the "Administer URL aliases" checkbox should be checked
    And the "Create and edit URL aliases" checkbox should be checked
    And the "Administer Quicktabs" checkbox should be checked
    And the "Administer URL redirections" checkbox should be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should be checked
    And the "Assign Content approver role" checkbox should be checked
    And the "Assign Site builder role" checkbox should be checked
    And the "Assign Site editor role" checkbox should be checked
    And the "Administer scheduler" checkbox should be checked
    And the "Schedule content publication" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should be checked
    And the "Administer Search API" checkbox should be checked
    And the "Administer shield module" checkbox should be checked
    And the "Administer shortcuts" checkbox should be checked
    And the "Edit current shortcut set" checkbox should be checked
    And the "Select any shortcut set" checkbox should be checked
    And the "Administer themes" checkbox should be checked
    And the "Administer actions" checkbox should be checked
    And the "Use the administration pages and help" checkbox should be checked
    And the "Use the site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "View site reports" checkbox should be checked
    And the "Administer vocabularies and terms" checkbox should be checked
    And the "Edit terms in Tags" checkbox should be checked
    And the "Delete terms from Tags" checkbox should be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer users" checkbox should be checked
    And the "View user profiles" checkbox should be checked
    And the "View User Actions" checkbox should be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should be checked
    And the "Bypass views access control" checkbox should be checked
    And the "Access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should be checked
    And the "Delete all webform submissions" checkbox should be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "Set Webform submission storage periods" checkbox should be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should be checked
    And the "Bypass moderation restrictions" checkbox should be checked
    And the "View moderation history" checkbox should be checked
    And the "View the moderation messages on a node" checkbox should be checked
    And the "Use \"My drafts\" workbench tab" checkbox should be checked
    And the "Use \"Needs review\" workbench tab" checkbox should be checked
    And the "Moderate all content from Draft to Needs Review" checkbox should be checked
    And the "Moderate all content from Needs Review to Draft" checkbox should be checked
    And the "Moderate all content from Needs Review to Published" checkbox should be checked
    And the "Administer XML sitemap settings." checkbox should be checked

  @api @role
  Scenario: Check Administrator user permissions
    Given I am logged in as a user named "gerry_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "administrator" row
    Then the "Administer theme settings" checkbox should be checked
    And the "Administer block types" checkbox should be checked
    And the "Administer beans" checkbox should be checked
    And the "Access the Bean overview page" checkbox should be checked
    And the "Change the View Mode of the Bean" checkbox should be checked
    And the "View Bean page" checkbox should be checked
    And the "Administer Bean Settings" checkbox should be checked
    And the "View Bean revisions" checkbox should be checked
    And the "Basic content: Add Bean" checkbox should be checked
    And the "Basic content: Edit Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "Image and Text: Add Bean" checkbox should be checked
    And the "Image and Text: Edit Bean" checkbox should be checked
    And the "Image and Text: Delete Bean" checkbox should be checked
    And the "Administer blocks" checkbox should be checked
    And the "Administer comments and comment settings" checkbox should be checked
    And the "Administer contact forms and contact form settings" checkbox should be checked
    And the "Administer Crumbs" checkbox should be checked
    And the "Administer Display Suite" checkbox should be checked
    And the "Access draggable views" checkbox should be checked
    And the "Access event log" checkbox should be checked
    And the "Administer fields" checkbox should be checked
    And the "Bypass file access control" checkbox should be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should be checked
    And the "Administer image styles" checkbox should be checked
    And the "Access broken links report" checkbox should be checked
    And the "Access own broken links report" checkbox should be checked
    And the "Administer Maintenance Mode" checkbox should be checked
    And the "Add media from remote services" checkbox should be checked
    And the "Administer menus and menu items" checkbox should be checked
    And the "Administer meta tags" checkbox should be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass content access control" checkbox should be checked
    And the "Administer content types" checkbox should be checked
    And checkbox from xpath "//input[contains(@id, 'administer-nodes')]" should be checked
    And the "Access the content overview page" checkbox should be checked
    And the "View content revisions" checkbox should be checked
    And the "Revert content revisions" checkbox should be checked
    And the "Webform: Create new content" checkbox should be checked
    And the "Webform: Edit own content" checkbox should be checked
    And the "Webform: Edit any content" checkbox should be checked
    And the "Webform: Delete own content" checkbox should be checked
    And the "Webform: Delete any content" checkbox should be checked
    And the "Use Page Manager" checkbox should be checked
    And the "Use Panels Dashboard" checkbox should be checked
    And the "View administrative links on Panel panes" checkbox should be checked
    And the "Configure access settings on Panel panes" checkbox should be checked
    And the "Use the Panels In-Place Editor" checkbox should be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should be checked
    And the "Configure advanced settings on Panel panes" checkbox should be checked
    And the "Configure caching settings on Panels" checkbox should be checked
    And the "Use panel locks" checkbox should be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should be checked
    And the "Unlock expired accounts" checkbox should be checked
    And the "Force password change" checkbox should be checked
    And the "Administer URL aliases" checkbox should be checked
    And the "Create and edit URL aliases" checkbox should be checked
    And the "Administer Quicktabs" checkbox should be checked
    And the "Administer URL redirections" checkbox should be checked
    And the "Assign all roles" checkbox should be checked
    And the "Assign Content editor role" checkbox should be checked
    And the "Assign Content approver role" checkbox should be checked
    And the "Assign Site builder role" checkbox should be checked
    And the "Assign Site editor role" checkbox should be checked
    And the "Administer scheduler" checkbox should be checked
    And the "Schedule content publication" checkbox should be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should be checked
    And the "Administer Search API" checkbox should be checked
    And the "Administer shield module" checkbox should be checked
    And the "Administer shortcuts" checkbox should be checked
    And the "Edit current shortcut set" checkbox should be checked
    And the "Select any shortcut set" checkbox should be checked
    And the "Administer themes" checkbox should be checked
    And the "Administer actions" checkbox should be checked
    And the "Use the administration pages and help" checkbox should be checked
    And the "Use the site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "View site reports" checkbox should be checked
    And the "Administer vocabularies and terms" checkbox should be checked
    And the "Edit terms in Tags" checkbox should be checked
    And the "Delete terms from Tags" checkbox should be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer users" checkbox should be checked
    And the "View user profiles" checkbox should be checked
    And the "View User Actions" checkbox should be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should be checked
    And the "Bypass views access control" checkbox should be checked
    And the "Access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should be checked
    And the "Delete all webform submissions" checkbox should be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "Set Webform submission storage periods" checkbox should be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should be checked
    And the "Bypass moderation restrictions" checkbox should be checked
    And the "View moderation history" checkbox should be checked
    And the "View the moderation messages on a node" checkbox should be checked
    And the "Use \"My drafts\" workbench tab" checkbox should be checked
    And the "Use \"Needs review\" workbench tab" checkbox should be checked
    And the "Moderate all content from Draft to Needs Review" checkbox should be checked
    And the "Moderate all content from Needs Review to Draft" checkbox should be checked
    And the "Moderate all content from Needs Review to Published" checkbox should be checked
    And the "Administer XML sitemap settings." checkbox should be checked
