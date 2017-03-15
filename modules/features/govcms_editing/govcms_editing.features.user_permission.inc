<?php
/**
 * @file
 * govcms_editing.features.user_permission.inc
 */

/**
 * Implements hook_user_default_permissions().
 */
function govcms_editing_user_default_permissions() {
  $permissions = array();

  // Exported permission: 'access media browser'.
  $permissions['access media browser'] = array(
    'name' => 'access media browser',
    'roles' => array(
      'Content approver' => 'Content approver',
      'Content editor' => 'Content editor',
      'Site builder' => 'Site builder',
      'Site editor' => 'Site editor',
      'administrator' => 'administrator',
    ),
    'module' => 'media',
  );

  // Exported permission: 'use media wysiwyg'.
  $permissions['use media wysiwyg'] = array(
    'name' => 'use media wysiwyg',
    'roles' => array(
      'Content approver' => 'Content approver',
      'Content editor' => 'Content editor',
      'Site editor' => 'Site editor',
      'administrator' => 'administrator',
    ),
    'module' => 'media_wysiwyg',
  );

  return $permissions;
}
