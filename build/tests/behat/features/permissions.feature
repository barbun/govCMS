Feature: Permissions
  Check that permissions are as expected.

  @api @role @wip
  Scenario: Check anonymous user permissions
    Given I am logged in as a user named "amy_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "anonymous user" row
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
    And the "Use CTools importer" checkbox should not be checked
    And the "Administer comments and comment settings" checkbox should not be checked
    And the "View comments" checkbox should be checked
    And the "Post comments" checkbox should be checked
    And the "Skip comment approval" checkbox should not be checked
    And the "Edit own comments" checkbox should be checked
    And the "Administer contact forms and contact form settings" checkbox should not be checked
    And the "Use the site-wide contact form" checkbox should be checked
    And the "Use users' personal contact forms" checkbox should not be checked
    #
    # Really?
    And the "Use contextual links" checkbox should be checked
    #
    And the "Administer Crumbs" checkbox should not be checked
    And the "Add custom contextual links" checkbox should not be checked
    And the "Edit node machine name" checkbox should not be checked
    And the "Administer Default configuration" checkbox should not be checked
    And the "Administer Display Suite" checkbox should not be checked
    And the "Access draggable views" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer features" checkbox should not be checked
    And the "Manage features" checkbox should not be checked
    And the "Generate features" checkbox should not be checked
    And the "Edit feature machine name" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access control" checkbox should not be checked
    And the "Administer file types" checkbox should not be checked
    And the "Administer files" checkbox should not be checked
    And the "Add and upload new files" checkbox should not be checked
    And the "View own private files" checkbox should not be checked
    And the "View own files" checkbox should not be checked
    And the "View private files" checkbox should not be checked
    And the "View files" checkbox should be checked
    And the "Image: Edit own files" checkbox should not be checked
    And the "Image: Edit any files" checkbox should not be checked
    And the "Image: Delete own files" checkbox should not be checked
    And the "Image: Delete any files" checkbox should not be checked
    And the "Image: Download own files" checkbox should not be checked
    And the "Image: Download any files" checkbox should not be checked
    And the "Video: Edit own files" checkbox should not be checked
    And the "Video: Edit any files" checkbox should not be checked
    And the "Video: Delete own files" checkbox should not be checked
    And the "Video: Delete any files" checkbox should not be checked
    And the "Video: Download own files" checkbox should not be checked
    And the "Video: Download any files" checkbox should not be checked
    And the "Audio: Edit own files" checkbox should not be checked
    And the "Audio: Edit any files" checkbox should not be checked
    And the "Audio: Delete own files" checkbox should not be checked
    And the "Audio: Delete any files" checkbox should not be checked
    And the "Audio: Download own files" checkbox should not be checked
    And the "Audio: Download any files" checkbox should not be checked
    And the "Document: Edit own files" checkbox should not be checked
    And the "Document: Edit any files" checkbox should not be checked
    And the "Document: Delete own files" checkbox should not be checked
    And the "Document: Delete any files" checkbox should not be checked
    And the "Document: Download own files" checkbox should not be checked
    And the "Document: Download any files" checkbox should not be checked
    And the "Administer File lock" checkbox should not be checked
    And the "Administer text formats and filters" checkbox should not be checked
    And the "Use the Rich text text format" checkbox should not be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Opt-in or out of tracking" checkbox should not be checked
    And the "Use PHP for tracking visibility" checkbox should not be checked
    And the "Add JavaScript snippets" checkbox should not be checked
    And the "access google analytics reports" checkbox should not be checked
    And the "administer google analytics reports api" checkbox should not be checked
    And the "Administer Honeypot" checkbox should not be checked
    And the "Bypass Honeypot protection" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer linkchecker" checkbox should not be checked
    And the "Edit link settings" checkbox should not be checked
    And the "Administer Linkit" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "Administer media browser" checkbox should not be checked
    And the "Use the media browser" checkbox should not be checked
    And the "Add media from remote services" checkbox should not be checked
    And the "Use Media WYSIWYG in an editor" checkbox should not be checked
    And the "Administer menus and menu items" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should not be checked
    And the "Administer the list of modules that can be managed by others" checkbox should not be checked
    And the "Administer managed modules" checkbox should not be checked
    And the "Administer managed modules permissions" checkbox should not be checked
    And the "Administer Module Filter" checkbox should not be checked
    And the "Use the administration navbar" checkbox should not be checked
    And the "Bypass content access control" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And the "Administer content" checkbox should not be checked
    And the "Access the content overview page" checkbox should not be checked
    And the "View published content" checkbox should be checked
    And the "View own unpublished content" checkbox should not be checked
    And the "View content revisions" checkbox should not be checked
    And the "Revert content revisions" checkbox should not be checked
    And the "Delete content revisions" checkbox should not be checked
    And the "Standard page: Create new content" checkbox should not be checked
    And the "Standard page: Edit own content" checkbox should not be checked
    And the "Standard page: Edit any content" checkbox should not be checked
    And the "Standard page: Delete own content" checkbox should not be checked
    And the "Standard page: Delete any content" checkbox should not be checked
    And the "Blog Article: Create new content" checkbox should not be checked
    And the "Blog Article: Edit own content" checkbox should not be checked
    And the "Blog Article: Edit any content" checkbox should not be checked
    And the "Blog Article: Delete own content" checkbox should not be checked
    And the "Blog Article: Delete any content" checkbox should not be checked
    And the "Event: Create new content" checkbox should not be checked
    And the "Event: Edit own content" checkbox should not be checked
    And the "Event: Edit any content" checkbox should not be checked
    And the "Event: Delete own content" checkbox should not be checked
    And the "Event: Delete any content" checkbox should not be checked
    And the "Media Release: Create new content" checkbox should not be checked
    And the "Media Release: Edit own content" checkbox should not be checked
    And the "Media Release: Edit any content" checkbox should not be checked
    And the "Media Release: Delete own content" checkbox should not be checked
    And the "Media Release: Delete any content" checkbox should not be checked
    And the "News Article: Create new content" checkbox should not be checked
    And the "News Article: Edit own content" checkbox should not be checked
    And the "News Article: Edit any content" checkbox should not be checked
    And the "News Article: Delete own content" checkbox should not be checked
    And the "News Article: Delete any content" checkbox should not be checked
    And the "Promotion: Create new content" checkbox should not be checked
    And the "Promotion: Edit own content" checkbox should not be checked
    And the "Promotion: Edit any content" checkbox should not be checked
    And the "Promotion: Delete own content" checkbox should not be checked
    And the "Promotion: Delete any content" checkbox should not be checked
    And the "Publication: Create new content" checkbox should not be checked
    And the "Publication: Edit own content" checkbox should not be checked
    And the "Publication: Edit any content" checkbox should not be checked
    And the "Publication: Delete own content" checkbox should not be checked
    And the "Publication: Delete any content" checkbox should not be checked
    And the "Slide: Create new content" checkbox should not be checked
    And the "Slide: Edit own content" checkbox should not be checked
    And the "Slide: Edit any content" checkbox should not be checked
    And the "Slide: Delete own content" checkbox should not be checked
    And the "Slide: Delete any content" checkbox should not be checked
    And the "Consultation: Create new content" checkbox should not be checked
    And the "Consultation: Edit own content" checkbox should not be checked
    And the "Consultation: Edit any content" checkbox should not be checked
    And the "Consultation: Delete own content" checkbox should not be checked
    And the "Consultation: Delete any content" checkbox should not be checked
    And the "Webform: Create new content" checkbox should not be checked
    And the "Webform: Edit own content" checkbox should not be checked
    And the "Webform: Edit any content" checkbox should not be checked
    And the "Webform: Delete own content" checkbox should not be checked
    And the "Webform: Delete any content" checkbox should not be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Administer Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "View administrative links on Panel panes" checkbox should not be checked
    And the "Configure access settings on Panel panes" checkbox should not be checked
    And the "Use the Panels In-Place Editor" checkbox should not be checked
    And the "Change layouts with the Panels In-Place Editor" checkbox should not be checked
    And the "Bypass access checks when using Panels In-Place Editor" checkbox should not be checked
    And the "Configure advanced settings on Panel panes" checkbox should not be checked
    And the "Administer Panels layouts" checkbox should not be checked
    And the "Administer Panels styles" checkbox should not be checked
    And the "Configure caching settings on Panels" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "Use the Panels In-Place Editor with Page Manager" checkbox should not be checked
    And the "Administer paragraphs bundles" checkbox should not be checked
    And the "Administer policies" checkbox should not be checked
    And the "Unlock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "Create and edit URL aliases" checkbox should not be checked
    And the "Administer pathauto" checkbox should not be checked
    And the "Notify of Path Changes" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "Administer URL redirections" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer rule configurations" checkbox should not be checked
    And the "Bypass Rules access control" checkbox should not be checked
    And the "Access the Rules debug log" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "Schedule content publication" checkbox should not be checked
    And the "View scheduled content list" checkbox should not be checked
    And the "Override default scheduler time" checkbox should not be checked
    And the "Administer search" checkbox should not be checked
    And the "Use search" checkbox should be checked
    And the "Use advanced search" checkbox should not be checked
    And the "Administer Search API" checkbox should not be checked
    And the "Access all search pages" checkbox should be checked
    And the "Access Search search page" checkbox should not be checked
    And the "Administer SecKit" checkbox should not be checked
    And the "Access to Service Links" checkbox should be checked
    And the "Use PHP for Service visibility" checkbox should not be checked
    And the "Administer shield module" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "Edit current shortcut set" checkbox should not be checked
    And the "Select any shortcut set" checkbox should not be checked
    And the "View published site map" checkbox should be checked
    And the "Administer Superfish" checkbox should not be checked
    And the "Administer modules" checkbox should not be checked
    And the "Administer site configuration" checkbox should not be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer software updates" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "Use the administration pages and help" checkbox should not be checked
    And the "Use the site in maintenance mode" checkbox should not be checked
    And the "View the administration theme" checkbox should not be checked
    And the "View site reports" checkbox should not be checked
    And the "Block IP addresses" checkbox should not be checked
    And the "Administer vocabularies and terms" checkbox should not be checked
    And the "Edit terms in Tags" checkbox should not be checked
    And the "Delete terms from Tags" checkbox should not be checked
    And the "Edit terms in Update type" checkbox should not be checked
    And the "Delete terms from Update type" checkbox should not be checked
    And the "Administer Twitter Block" checkbox should not be checked
    And the "Administer UUID" checkbox should not be checked
    And the "Administer permissions" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "View user profiles" checkbox should not be checked
    And the "Change own username" checkbox should not be checked
    And the "Cancel own user account" checkbox should not be checked
    And the "Select method for cancelling own account" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "Change own e-mail" checkbox should not be checked
    And the "Change own password" checkbox should not be checked
    And the "Change own OpenID" checkbox should not be checked
    And the "Administer User protect" checkbox should not be checked
    And the "Edit own user account" checkbox should not be checked
    And the "View any unpublished content" checkbox should not be checked
    And the "Standard page: View any unpublished content" checkbox should not be checked
    And the "Blog Article: View any unpublished content" checkbox should not be checked
    And the "Event: View any unpublished content" checkbox should not be checked
    And the "Media Release: View any unpublished content" checkbox should not be checked
    And the "News Article: View any unpublished content" checkbox should not be checked
    And the "Promotion: View any unpublished content" checkbox should not be checked
    And the "Publication: View any unpublished content" checkbox should not be checked
    And the "Slide: View any unpublished content" checkbox should not be checked
    And the "Consultation: View any unpublished content" checkbox should not be checked
    And the "Webform: View any unpublished content" checkbox should not be checked
    And the "Administer views" checkbox should not be checked
    And the "Bypass views access control" checkbox should not be checked
    And the "Access all webform results" checkbox should not be checked
    And the "Access own webform results" checkbox should not be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should not be checked
    And the "Edit own webform submissions" checkbox should not be checked
    And the "Delete own webform submissions" checkbox should not be checked
    And the "Content authors: access and edit webform components and settings" checkbox should not be checked
    And the "Set Webform submission storage periods" checkbox should not be checked
    And the "Administer Workbench settings" checkbox should not be checked
    And the "Access My Workbench" checkbox should not be checked
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
    And the "Administer robots.txt" checkbox should not be checked

