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
    And the "Administer bean types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "access bean overview" checkbox should not be checked
    And the "edit bean view mode" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "create any basic_content bean" checkbox should not be checked
    And the "edit any basic_content bean" checkbox should not be checked
    And the "Basic content: View Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should not be checked
    And the "create any image_and_text bean" checkbox should not be checked
    And the "edit any image_and_text bean" checkbox should not be checked
    And the "Image and Text: View Bean" checkbox should be checked
    And the "delete any image_and_text bean" checkbox should not be checked
    And the "Administer blocks" checkbox should not be checked
    And the "administer comments" checkbox should not be checked
    And the "access comments" checkbox should be checked
    And the "Post comments" checkbox should be checked
    And the "Skip comment approval" checkbox should not be checked
    And the "Edit own comments" checkbox should be checked
    And the "administer contact forms" checkbox should not be checked
    And the "Use contextual links" checkbox should be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "admin_display_suite" checkbox should not be checked
    And the "Access draggableviews" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access" checkbox should not be checked
    And the "Administer files" checkbox should not be checked
    And the "Use the Rich text text format" checkbox should not be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "add media from remote sources" checkbox should not be checked
    And the "Administer menu" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should not be checked
    And the "Bypass node access" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And the "Administer nodes" should not be checked
    And the "Access content overview" checkbox should not be checked
    And the "Access content" checkbox should be checked
    And the "View own unpublished content" checkbox should not be checked
    And the "View revisions" checkbox should not be checked
    And the "Revert revisions" checkbox should not be checked
    And the "create webform content" checkbox should not be checked
    And the "edit own webform content" checkbox should not be checked
    And the "edit any webform content" checkbox should not be checked
    And the "delete own webform content" checkbox should not be checked
    And the "delete any webform content" checkbox should not be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "view pane admin links" checkbox should not be checked
    And the "administer pane access" checkbox should not be checked
    And the "use panels in place editing" checkbox should not be checked
    And the "change layouts in place editing" checkbox should not be checked
    And the "administer advanced pane settings" checkbox should not be checked
    And the "use panels caching features" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "use ipe with page manager" checkbox should not be checked
    And the "unblock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "create url aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "administer redirects" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "schedule publishing of nodes" checkbox should not be checked
    And the "Override default scheduler time" checkbox should not be checked
    And the "Administer search" checkbox should not be checked
    And the "search content" checkbox should be checked
    And the "Administer Search API" checkbox should not be checked
    And the "access service links" checkbox should be checked
    And the "administer shield" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "customize shortcut links" checkbox should not be checked
    And the "switch shortcut sets" checkbox should not be checked
    And the "access site map" checkbox should be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "access administration pages" checkbox should not be checked
    And the "access site in maintenance mode" checkbox should not be checked
    And the "View the administration theme" checkbox should not be checked
    And the "access site reports" checkbox should not be checked
    And the "administer taxonomy" checkbox should not be checked
    And the "edit terms in 1" checkbox should not be checked
    And the "delete terms in 1" checkbox should not be checked
    And the "edit terms in 2" checkbox should not be checked
    And the "delete terms in 2" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "access user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should not be checked
    And the "Administer views" checkbox should not be checked
    And the "access all views" checkbox should not be checked
    And the "access all webform results" checkbox should not be checked
    And the "Access own webform results" checkbox should not be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should not be checked
    And the "Edit own webform submissions" checkbox should not be checked
    And the "Delete own webform submissions" checkbox should not be checked
    And the "set webform_clear times" checkbox should not be checked
    And the "View all unpublished content" checkbox should not be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "bypass workbench moderation" checkbox should not be checked
    And the "View moderation history" checkbox should not be checked
    And the "view moderation messages" checkbox should not be checked
    And the "use workbench_moderation my drafts tab" checkbox should not be checked
    And the "use workbench_moderation needs review tab" checkbox should not be checked
    And the "moderate content from draft to needs_review" checkbox should not be checked
    And the "moderate content from needs_review to draft" checkbox should not be checked
    And the "moderate content from needs_review to published" checkbox should not be checked
    And the "administer xmlsitemap" checkbox should not be checked

  @api @role
  Scenario: Check authenticated user permissions
    Given I am logged in as a user named "betty_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "authenticated user" row
    Then the "Administer theme settings" checkbox should not be checked
    And the "Administer bean types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "access bean overview" checkbox should not be checked
    And the "edit bean view mode" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "create any basic_content bean" checkbox should not be checked
    And the "edit any basic_content bean" checkbox should not be checked
    And the "Basic content: View Bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should not be checked
    And the "create any image_and_text bean" checkbox should not be checked
    And the "edit any image_and_text bean" checkbox should not be checked
    And the "Image and Text: View Bean" checkbox should be checked
    And the "delete any image_and_text bean" checkbox should not be checked
    And the "Administer blocks" checkbox should not be checked
    And the "administer comments" checkbox should not be checked
    And the "access comments" checkbox should be checked
    And the "Post comments" checkbox should be checked
    And the "Skip comment approval" checkbox should be checked
    And the "Edit own comments" checkbox should be checked
    And the "administer contact forms" checkbox should not be checked
    And the "Use contextual links" checkbox should be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "admin_display_suite" checkbox should not be checked
    And the "Access draggableviews" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access" checkbox should not be checked
    And the "Administer files" checkbox should not be checked
    And the "Use the Rich text text format" checkbox should be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "add media from remote sources" checkbox should not be checked
    And the "Administer menu" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should not be checked
    And the "Bypass node access" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And the "Administer nodes" should not be checked
    And the "Access content overview" checkbox should not be checked
    And the "Access content" checkbox should be checked
    And the "View own unpublished content" checkbox should be checked
    And the "View revisions" checkbox should not be checked
    And the "Revert revisions" checkbox should not be checked
    And the "create webform content" checkbox should not be checked
    And the "edit own webform content" checkbox should not be checked
    And the "edit any webform content" checkbox should not be checked
    And the "delete own webform content" checkbox should not be checked
    And the "delete any webform content" checkbox should not be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "view pane admin links" checkbox should not be checked
    And the "administer pane access" checkbox should not be checked
    And the "use panels in place editing" checkbox should not be checked
    And the "change layouts in place editing" checkbox should not be checked
    And the "administer advanced pane settings" checkbox should not be checked
    And the "use panels caching features" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "use ipe with page manager" checkbox should not be checked
    And the "unblock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "create url aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "administer redirects" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "schedule publishing of nodes" checkbox should not be checked
    And the "Override default scheduler time" checkbox should not be checked
    And the "Administer search" checkbox should not be checked
    And the "search content" checkbox should be checked
    And the "Administer Search API" checkbox should not be checked
    And the "access service links" checkbox should be checked
    And the "administer shield" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "customize shortcut links" checkbox should not be checked
    And the "switch shortcut sets" checkbox should not be checked
    And the "access site map" checkbox should be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "access administration pages" checkbox should not be checked
    And the "access site in maintenance mode" checkbox should not be checked
    And the "View the administration theme" checkbox should not be checked
    And the "access site reports" checkbox should not be checked
    And the "administer taxonomy" checkbox should not be checked
    And the "edit terms in 1" checkbox should not be checked
    And the "delete terms in 1" checkbox should not be checked
    And the "edit terms in 2" checkbox should not be checked
    And the "delete terms in 2" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "access user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should not be checked
    And the "Administer views" checkbox should not be checked
    And the "access all views" checkbox should not be checked
    And the "access all webform results" checkbox should not be checked
    And the "Access own webform results" checkbox should not be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should not be checked
    And the "Edit own webform submissions" checkbox should not be checked
    And the "Delete own webform submissions" checkbox should not be checked
    And the "set webform_clear times" checkbox should not be checked
    And the "View all unpublished content" checkbox should not be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "bypass workbench moderation" checkbox should not be checked
    And the "View moderation history" checkbox should not be checked
    And the "view moderation messages" checkbox should not be checked
    And the "use workbench_moderation my drafts tab" checkbox should not be checked
    And the "use workbench_moderation needs review tab" checkbox should not be checked
    And the "moderate content from draft to needs_review" checkbox should not be checked
    And the "moderate content from needs_review to draft" checkbox should not be checked
    And the "moderate content from needs_review to published" checkbox should not be checked
    And the "administer xmlsitemap" checkbox should not be checked

  @api @role
  Scenario: Check Content editor user permissions
    Given I am logged in as a user named "christine_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Content editor" row
    Then the "Administer theme settings" checkbox should not be checked
    And the "Administer bean types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "access bean overview" checkbox should not be checked
    And the "edit bean view mode" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "create any basic_content bean" checkbox should be checked
    And the "edit any basic_content bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "create any image_and_text bean" checkbox should be checked
    And the "edit any image_and_text bean" checkbox should be checked
    And the "delete any image_and_text bean" checkbox should be checked
    And the "Administer blocks" checkbox should not be checked
    And the "administer comments" checkbox should not be checked
    And the "administer contact forms" checkbox should not be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "admin_display_suite" checkbox should not be checked
    And the "Access draggableviews" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access" checkbox should not be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "add media from remote sources" checkbox should be checked
    And the "Administer menu" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass node access" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And the "Administer nodes" should not be checked
    And the "Access content overview" checkbox should be checked
    And the "View revisions" checkbox should be checked
    And the "Revert revisions" checkbox should be checked
    And the "create webform content" checkbox should be checked
    And the "edit own webform content" checkbox should not be checked
    And the "edit any webform content" checkbox should be checked
    And the "delete own webform content" checkbox should not be checked
    And the "delete any webform content" checkbox should be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "view pane admin links" checkbox should not be checked
    And the "administer pane access" checkbox should not be checked
    And the "use panels in place editing" checkbox should not be checked
    And the "change layouts in place editing" checkbox should not be checked
    And the "administer advanced pane settings" checkbox should not be checked
    And the "use panels caching features" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "use ipe with page manager" checkbox should not be checked
    And the "unblock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "create url aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "administer redirects" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "schedule publishing of nodes" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should not be checked
    And the "Administer Search API" checkbox should not be checked
    And the "administer shield" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "customize shortcut links" checkbox should not be checked
    And the "switch shortcut sets" checkbox should not be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "access administration pages" checkbox should be checked
    And the "access site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "access site reports" checkbox should not be checked
    And the "administer taxonomy" checkbox should not be checked
    And the "edit terms in 1" checkbox should not be checked
    And the "delete terms in 1" checkbox should not be checked
    And the "edit terms in 2" checkbox should not be checked
    And the "delete terms in 2" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "access user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should not be checked
    And the "access all views" checkbox should not be checked
    And the "access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "set webform_clear times" checkbox should not be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "bypass workbench moderation" checkbox should not be checked
    And the "View moderation history" checkbox should be checked
    And the "view moderation messages" checkbox should be checked
    And the "use workbench_moderation my drafts tab" checkbox should be checked
    And the "use workbench_moderation needs review tab" checkbox should be checked
    And the "moderate content from draft to needs_review" checkbox should be checked
    And the "moderate content from needs_review to draft" checkbox should be checked
    And the "moderate content from needs_review to published" checkbox should not be checked
    And the "administer xmlsitemap" checkbox should not be checked

  @api @role
  Scenario: Check Content approver user permissions
    Given I am logged in as a user named "daniel_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Content approver" row
    Then the "Administer theme settings" checkbox should not be checked
    And the "Administer bean types" checkbox should not be checked
    And the "Administer beans" checkbox should not be checked
    And the "access bean overview" checkbox should not be checked
    And the "edit bean view mode" checkbox should not be checked
    And the "View Bean page" checkbox should not be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should not be checked
    And the "create any basic_content bean" checkbox should be checked
    And the "edit any basic_content bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "create any image_and_text bean" checkbox should be checked
    And the "edit any image_and_text bean" checkbox should be checked
    And the "delete any image_and_text bean" checkbox should be checked
    And the "Administer blocks" checkbox should not be checked
    And the "administer comments" checkbox should not be checked
    And the "administer contact forms" checkbox should not be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "admin_display_suite" checkbox should not be checked
    And the "Access draggableviews" checkbox should not be checked
    And the "Access event log" checkbox should not be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access" checkbox should not be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should not be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should not be checked
    And the "Access own broken links report" checkbox should not be checked
    And the "Administer Maintenance Mode" checkbox should not be checked
    And the "add media from remote sources" checkbox should be checked
    And the "Administer menu" checkbox should not be checked
    And the "Administer meta tags" checkbox should not be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass node access" checkbox should not be checked
    And the "Administer content types" checkbox should not be checked
    And the "Administer nodes" should not be checked
    And the "Access content overview" checkbox should be checked
    And the "View revisions" checkbox should be checked
    And the "Revert revisions" checkbox should be checked
    And the "create webform content" checkbox should be checked
    And the "edit own webform content" checkbox should not be checked
    And the "edit any webform content" checkbox should be checked
    And the "delete own webform content" checkbox should not be checked
    And the "delete any webform content" checkbox should be checked
    And the "Use Page Manager" checkbox should not be checked
    And the "Use Panels Dashboard" checkbox should not be checked
    And the "view pane admin links" checkbox should not be checked
    And the "administer pane access" checkbox should not be checked
    And the "use panels in place editing" checkbox should not be checked
    And the "change layouts in place editing" checkbox should not be checked
    And the "administer advanced pane settings" checkbox should not be checked
    And the "use panels caching features" checkbox should not be checked
    And the "Use panel locks" checkbox should not be checked
    And the "use ipe with page manager" checkbox should not be checked
    And the "unblock expired accounts" checkbox should not be checked
    And the "Force password change" checkbox should not be checked
    And the "Administer URL aliases" checkbox should not be checked
    And the "create url aliases" checkbox should not be checked
    And the "Administer Quicktabs" checkbox should not be checked
    And the "administer redirects" checkbox should not be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should not be checked
    And the "schedule publishing of nodes" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should not be checked
    And the "Administer Search API" checkbox should not be checked
    And the "administer shield" checkbox should not be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "customize shortcut links" checkbox should not be checked
    And the "switch shortcut sets" checkbox should not be checked
    And the "Administer themes" checkbox should not be checked
    And the "Administer actions" checkbox should not be checked
    And the "access administration pages" checkbox should be checked
    And the "access site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "access site reports" checkbox should not be checked
    And the "administer taxonomy" checkbox should not be checked
    And the "edit terms in 1" checkbox should not be checked
    And the "delete terms in 1" checkbox should not be checked
    And the "edit terms in 2" checkbox should not be checked
    And the "delete terms in 2" checkbox should not be checked
    And the "Administer users" checkbox should not be checked
    And the "access user profiles" checkbox should not be checked
    And the "View User Actions" checkbox should not be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should not be checked
    And the "access all views" checkbox should not be checked
    And the "access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should not be checked
    And the "Delete all webform submissions" checkbox should not be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "set webform_clear times" checkbox should not be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should not be checked
    And the "bypass workbench moderation" checkbox should not be checked
    And the "View moderation history" checkbox should be checked
    And the "view moderation messages" checkbox should be checked
    And the "use workbench_moderation my drafts tab" checkbox should be checked
    And the "use workbench_moderation needs review tab" checkbox should be checked
    And the "moderate content from draft to needs_review" checkbox should be checked
    And the "moderate content from needs_review to draft" checkbox should be checked
    And the "moderate content from needs_review to published" checkbox should be checked
    And the "administer xmlsitemap" checkbox should not be checked

  @api @role
  Scenario: Check Site Builder user permissions
    Given I am logged in as a user named "eric_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Site builder" row
    Then the "Administer theme settings" checkbox should be checked
    And the "Administer bean types" checkbox should be checked
    And the "Administer beans" checkbox should be checked
    And the "access bean overview" checkbox should be checked
    And the "edit bean view mode" checkbox should be checked
    And the "View Bean page" checkbox should be checked
    And the "Administer Bean Settings" checkbox should be checked
    And the "View Bean revisions" checkbox should be checked
    And the "create any basic_content bean" checkbox should be checked
    And the "edit any basic_content bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "create any image_and_text bean" checkbox should be checked
    And the "edit any image_and_text bean" checkbox should be checked
    And the "delete any image_and_text bean" checkbox should be checked
    And the "Administer blocks" checkbox should be checked
    And the "administer comments" checkbox should not be checked
    And the "administer contact forms" checkbox should be checked
    And the "Administer Crumbs" checkbox should be checked
    And the "admin_display_suite" checkbox should be checked
    And the "Access draggableviews" checkbox should be checked
    And the "Access event log" checkbox should be checked
    And the "Administer fields" checkbox should be checked
    And the "Bypass file access" checkbox should be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should be checked
    And the "Administer image styles" checkbox should be checked
    And the "Access broken links report" checkbox should be checked
    And the "Access own broken links report" checkbox should be checked
    And the "Administer Maintenance Mode" checkbox should be checked
    And the "add media from remote sources" checkbox should not be checked
    And the "Administer menu" checkbox should be checked
    And the "Administer meta tags" checkbox should be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass node access" checkbox should be checked
    And the "Administer content types" checkbox should be checked
    And the "Administer nodes" should be checked
    And the "Access content overview" checkbox should be checked
    And the "View revisions" checkbox should be checked
    And the "Revert revisions" checkbox should be checked
    And the "create webform content" checkbox should be checked
    And the "edit own webform content" checkbox should not be checked
    And the "edit any webform content" checkbox should be checked
    And the "delete own webform content" checkbox should not be checked
    And the "delete any webform content" checkbox should be checked
    And the "Use Page Manager" checkbox should be checked
    And the "Use Panels Dashboard" checkbox should be checked
    And the "view pane admin links" checkbox should be checked
    And the "administer pane access" checkbox should be checked
    And the "use panels in place editing" checkbox should be checked
    And the "change layouts in place editing" checkbox should be checked
    And the "administer advanced pane settings" checkbox should be checked
    And the "use panels caching features" checkbox should be checked
    And the "Use panel locks" checkbox should be checked
    And the "use ipe with page manager" checkbox should be checked
    And the "unblock expired accounts" checkbox should be checked
    And the "Force password change" checkbox should be checked
    And the "Administer URL aliases" checkbox should be checked
    And the "create url aliases" checkbox should be checked
    And the "Administer Quicktabs" checkbox should be checked
    And the "administer redirects" checkbox should be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should not be checked
    And the "Assign Content approver role" checkbox should not be checked
    And the "Assign Site builder role" checkbox should not be checked
    And the "Assign Site editor role" checkbox should not be checked
    And the "Administer scheduler" checkbox should be checked
    And the "schedule publishing of nodes" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should be checked
    And the "Administer Search API" checkbox should be checked
    And the "administer shield" checkbox should be checked
    And the "Administer shortcuts" checkbox should not be checked
    And the "customize shortcut links" checkbox should not be checked
    And the "switch shortcut sets" checkbox should not be checked
    And the "Administer themes" checkbox should be checked
    And the "Administer actions" checkbox should be checked
    And the "access administration pages" checkbox should be checked
    And the "access site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "access site reports" checkbox should be checked
    And the "administer taxonomy" checkbox should be checked
    And the "edit terms in 1" checkbox should be checked
    And the "delete terms in 1" checkbox should be checked
    And the "edit terms in 2" checkbox should not be checked
    And the "delete terms in 2" checkbox should not be checked
    And the "Administer users" checkbox should be checked
    And the "access user profiles" checkbox should be checked
    And the "View User Actions" checkbox should be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should be checked
    And the "access all views" checkbox should be checked
    And the "access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should be checked
    And the "Delete all webform submissions" checkbox should be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should not be checked
    And the "Delete own webform submissions" checkbox should not be checked
    And the "set webform_clear times" checkbox should be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should be checked
    And the "bypass workbench moderation" checkbox should be checked
    And the "View moderation history" checkbox should be checked
    And the "view moderation messages" checkbox should be checked
    And the "use workbench_moderation my drafts tab" checkbox should be checked
    And the "use workbench_moderation needs review tab" checkbox should be checked
    And the "moderate content from draft to needs_review" checkbox should not be checked
    And the "moderate content from needs_review to draft" checkbox should not be checked
    And the "moderate content from needs_review to published" checkbox should not be checked
    And the "administer xmlsitemap" checkbox should be checked

  @api @role
  Scenario: Check Site editor user permissions
    Given I am logged in as a user named "fred_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "Site editor" row
    Then the "Administer theme settings" checkbox should be checked
    And the "Administer bean types" checkbox should not be checked
    And the "Administer beans" checkbox should be checked
    And the "access bean overview" checkbox should be checked
    And the "edit bean view mode" checkbox should be checked
    And the "View Bean page" checkbox should be checked
    And the "Administer Bean Settings" checkbox should not be checked
    And the "View Bean revisions" checkbox should be checked
    And the "create any basic_content bean" checkbox should be checked
    And the "edit any basic_content bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "create any image_and_text bean" checkbox should be checked
    And the "edit any image_and_text bean" checkbox should be checked
    And the "delete any image_and_text bean" checkbox should be checked
    And the "Administer blocks" checkbox should be checked
    And the "administer comments" checkbox should be checked
    And the "administer contact forms" checkbox should be checked
    And the "Administer Crumbs" checkbox should not be checked
    And the "admin_display_suite" checkbox should not be checked
    And the "Access draggableviews" checkbox should be checked
    And the "Access event log" checkbox should be checked
    And the "Administer fields" checkbox should not be checked
    And the "Bypass file access" checkbox should be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should be checked
    And the "Administer image styles" checkbox should not be checked
    And the "Access broken links report" checkbox should be checked
    And the "Access own broken links report" checkbox should be checked
    And the "Administer Maintenance Mode" checkbox should be checked
    And the "add media from remote sources" checkbox should be checked
    And the "Administer menu" checkbox should be checked
    And the "Administer meta tags" checkbox should be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass node access" checkbox should be checked
    And the "Administer content types" checkbox should not be checked
    And the "Administer nodes" should be checked
    And the "Access content overview" checkbox should be checked
    And the "View revisions" checkbox should be checked
    And the "Revert revisions" checkbox should be checked
    And the "create webform content" checkbox should be checked
    And the "edit own webform content" checkbox should not be checked
    And the "edit any webform content" checkbox should be checked
    And the "delete own webform content" checkbox should not be checked
    And the "delete any webform content" checkbox should be checked
    And the "Use Page Manager" checkbox should be checked
    And the "Use Panels Dashboard" checkbox should be checked
    And the "view pane admin links" checkbox should be checked
    And the "administer pane access" checkbox should be checked
    And the "use panels in place editing" checkbox should be checked
    And the "change layouts in place editing" checkbox should be checked
    And the "administer advanced pane settings" checkbox should be checked
    And the "use panels caching features" checkbox should be checked
    And the "Use panel locks" checkbox should be checked
    And the "use ipe with page manager" checkbox should be checked
    And the "unblock expired accounts" checkbox should be checked
    And the "Force password change" checkbox should be checked
    And the "Administer URL aliases" checkbox should be checked
    And the "create url aliases" checkbox should be checked
    And the "Administer Quicktabs" checkbox should be checked
    And the "administer redirects" checkbox should be checked
    And the "Assign all roles" checkbox should not be checked
    And the "Assign Content editor role" checkbox should be checked
    And the "Assign Content approver role" checkbox should be checked
    And the "Assign Site builder role" checkbox should be checked
    And the "Assign Site editor role" checkbox should be checked
    And the "Administer scheduler" checkbox should be checked
    And the "schedule publishing of nodes" checkbox should not be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should be checked
    And the "Administer Search API" checkbox should be checked
    And the "administer shield" checkbox should be checked
    And the "Administer shortcuts" checkbox should be checked
    And the "customize shortcut links" checkbox should be checked
    And the "switch shortcut sets" checkbox should be checked
    And the "Administer themes" checkbox should be checked
    And the "Administer actions" checkbox should be checked
    And the "access administration pages" checkbox should be checked
    And the "access site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "access site reports" checkbox should be checked
    And the "administer taxonomy" checkbox should be checked
    And the "edit terms in 1" checkbox should be checked
    And the "delete terms in 1" checkbox should be checked
    And the "edit terms in 2" checkbox should not be checked
    And the "delete terms in 2" checkbox should not be checked
    And the "Administer users" checkbox should be checked
    And the "access user profiles" checkbox should be checked
    And the "View User Actions" checkbox should be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should be checked
    And the "access all views" checkbox should be checked
    And the "access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should be checked
    And the "Delete all webform submissions" checkbox should be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "set webform_clear times" checkbox should be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should be checked
    And the "bypass workbench moderation" checkbox should be checked
    And the "View moderation history" checkbox should be checked
    And the "view moderation messages" checkbox should be checked
    And the "use workbench_moderation my drafts tab" checkbox should be checked
    And the "use workbench_moderation needs review tab" checkbox should be checked
    And the "moderate content from draft to needs_review" checkbox should be checked
    And the "moderate content from needs_review to draft" checkbox should be checked
    And the "moderate content from needs_review to published" checkbox should be checked
    And the "administer xmlsitemap" checkbox should be checked

  @api @role
  Scenario: Check Administrator user permissions
    Given I am logged in as a user named "gerry_perms" with the "administrator" role that doesn't force password change
    When I go to "/admin/people/permissions/roles"
    And I click "edit permissions" in the "administrator" row
    Then the "Administer theme settings" checkbox should be checked
    And the "Administer bean types" checkbox should be checked
    And the "Administer beans" checkbox should be checked
    And the "access bean overview" checkbox should be checked
    And the "edit bean view mode" checkbox should be checked
    And the "View Bean page" checkbox should be checked
    And the "Administer Bean Settings" checkbox should be checked
    And the "View Bean revisions" checkbox should be checked
    And the "create any basic_content bean" checkbox should be checked
    And the "edit any basic_content bean" checkbox should be checked
    And the "Basic content: Delete Bean" checkbox should be checked
    And the "create any image_and_text bean" checkbox should be checked
    And the "edit any image_and_text bean" checkbox should be checked
    And the "delete any image_and_text bean" checkbox should be checked
    And the "Administer blocks" checkbox should be checked
    And the "administer comments" checkbox should be checked
    And the "administer contact forms" checkbox should be checked
    And the "Administer Crumbs" checkbox should be checked
    And the "admin_display_suite" checkbox should be checked
    And the "Access draggableviews" checkbox should be checked
    And the "Access event log" checkbox should be checked
    And the "Administer fields" checkbox should be checked
    And the "Bypass file access" checkbox should be checked
    And the "Administer files" checkbox should be checked
    And the "Administer Google Analytics" checkbox should be checked
    And the "Administer image styles" checkbox should be checked
    And the "Access broken links report" checkbox should be checked
    And the "Access own broken links report" checkbox should be checked
    And the "Administer Maintenance Mode" checkbox should be checked
    And the "add media from remote sources" checkbox should be checked
    And the "Administer menu" checkbox should be checked
    And the "Administer meta tags" checkbox should be checked
    And the "Edit meta tags" checkbox should be checked
    And the "Bypass node access" checkbox should be checked
    And the "Administer content types" checkbox should be checked
    And the "Administer nodes" should be checked
    And the "Access content overview" checkbox should be checked
    And the "View revisions" checkbox should be checked
    And the "Revert revisions" checkbox should be checked
    And the "create webform content" checkbox should be checked
    And the "edit own webform content" checkbox should be checked
    And the "edit any webform content" checkbox should be checked
    And the "delete own webform content" checkbox should be checked
    And the "delete any webform content" checkbox should be checked
    And the "Use Page Manager" checkbox should be checked
    And the "Use Panels Dashboard" checkbox should be checked
    And the "view pane admin links" checkbox should be checked
    And the "administer pane access" checkbox should be checked
    And the "use panels in place editing" checkbox should be checked
    And the "change layouts in place editing" checkbox should be checked
    And the "administer advanced pane settings" checkbox should be checked
    And the "use panels caching features" checkbox should be checked
    And the "Use panel locks" checkbox should be checked
    And the "use ipe with page manager" checkbox should be checked
    And the "unblock expired accounts" checkbox should be checked
    And the "Force password change" checkbox should be checked
    And the "Administer URL aliases" checkbox should be checked
    And the "create url aliases" checkbox should be checked
    And the "Administer Quicktabs" checkbox should be checked
    And the "administer redirects" checkbox should be checked
    And the "Assign all roles" checkbox should be checked
    And the "Assign Content editor role" checkbox should be checked
    And the "Assign Content approver role" checkbox should be checked
    And the "Assign Site builder role" checkbox should be checked
    And the "Assign Site editor role" checkbox should be checked
    And the "Administer scheduler" checkbox should be checked
    And the "schedule publishing of nodes" checkbox should be checked
    And the "Override default scheduler time" checkbox should be checked
    And the "Administer search" checkbox should be checked
    And the "Administer Search API" checkbox should be checked
    And the "administer shield" checkbox should be checked
    And the "Administer shortcuts" checkbox should be checked
    And the "customize shortcut links" checkbox should be checked
    And the "switch shortcut sets" checkbox should be checked
    And the "Administer themes" checkbox should be checked
    And the "Administer actions" checkbox should be checked
    And the "access administration pages" checkbox should be checked
    And the "access site in maintenance mode" checkbox should be checked
    And the "View the administration theme" checkbox should be checked
    And the "access site reports" checkbox should be checked
    And the "administer taxonomy" checkbox should be checked
    And the "edit terms in 1" checkbox should be checked
    And the "delete terms in 1" checkbox should be checked
    And the "edit terms in 2" checkbox should not be checked
    And the "delete terms in 2" checkbox should not be checked
    And the "Administer users" checkbox should be checked
    And the "access user profiles" checkbox should be checked
    And the "View User Actions" checkbox should be checked
    And the "View any unpublished content" checkbox should be checked
    And the "Administer views" checkbox should be checked
    And the "access all views" checkbox should be checked
    And the "access all webform results" checkbox should be checked
    And the "Access own webform results" checkbox should be checked
    And the "Edit all webform submissions" checkbox should be checked
    And the "Delete all webform submissions" checkbox should be checked
    And the "Access own webform submissions" checkbox should be checked
    And the "Edit own webform submissions" checkbox should be checked
    And the "Delete own webform submissions" checkbox should be checked
    And the "set webform_clear times" checkbox should be checked
    And the "View all unpublished content" checkbox should be checked
    And the "Administer Workbench Moderation" checkbox should be checked
    And the "bypass workbench moderation" checkbox should be checked
    And the "View moderation history" checkbox should be checked
    And the "view moderation messages" checkbox should be checked
    And the "use workbench_moderation my drafts tab" checkbox should be checked
    And the "use workbench_moderation needs review tab" checkbox should be checked
    And the "moderate content from draft to needs_review" checkbox should be checked
    And the "moderate content from needs_review to draft" checkbox should be checked
    And the "moderate content from needs_review to published" checkbox should be checked
    And the "administer xmlsitemap" checkbox should be checked
