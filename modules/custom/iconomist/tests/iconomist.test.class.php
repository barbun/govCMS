<?php

/**
 * @file
 * Iconomist Test Class.
 * Extends the real class, just overriding the helpers so we can test.
 */
require_once __DIR__ . '/../iconomist.class.php';

/**
 * Iconomist test class.
 * Test extension class for Iconomist. Overrides methods to make values
 * predictable).
 */
class IconomistTest extends Iconomist {

  private static $themeSettings = [];

  private static $variables = [];

  private static $headLinks = [];

  private static $formErrors = [];

  private static $managedFiles = array();

  private static $managedFileObjects = array();

  /**
   * Set the theme settings.
   *
   * @param array $values
   *   The array of settings for themeGetSetting to use.
   */
  public static function themeSetSettings(array $values) {
    self::$themeSettings = $values;
  }

  /**
   * Get the theme settings.
   *
   * @param string $settingName
   *   The name of the setting being sought.
   * @param string $theme
   *   The name of the theme for which settings should be retrieved.
   *
   * @return array
   *   The render array for the theme settings.
   */
  public static function themeGetSetting($settingName, $theme = '') {
    if (isset(self::$themeSettings[$theme][$settingName])) {
      return self::$themeSettings[$theme][$settingName];
    }

    return NULL;
  }

  /**
   * Mock version of setting a variable.
   *
   * @param string $variable
   *   The name of the variable to set.
   * @param mixed $value
   *   The value to assign to the variables.
   */
  public static function variableSet($variable, $value) {
    self::$variables[$variable] = $value;
  }

  /**
   * Mock version of variable_get.
   *
   * @param string $variable
   *   The name of the variable to get.
   * @param mixed $default
   *   The value to use if the variable isn't set.
   *
   * @return mixed
   *   The value of the variable (or the default value)
   */
  public static function variableGet($variable, $default) {
    return isset(self::$variables[$variable]) ? self::$variables[$variable] : $default;
  }

  /**
   * Get Html Head values that were set.
   *
   * @return array
   *   The attributes that were added to the page.
   */
  public static function htmlHeadLinks() {
    return self::$headLinks;
  }

  /**
   * Mockable interface to drupal_add_html_head_link.
   *
   * @param array $attributes
   *   The attributes being added to the page.
   */
  public static function drupalAddHtmlHeadLink(array $attributes) {
    self::$headLinks[] = $attributes;
  }

  /**
   * Retrieve form errors.
   *
   * @return array
   *   The list of form errors that were set.
   */
  public static function getFormErrors() {
    return self::$formErrors;
  }

  /**
   * Mocked version of form_error.
   *
   * @param string $element
   *   The name of the element against which the error is being flagged.
   * @param string $error
   *   The error message to be displayed.
   */
  public static function formError($element, $error) {
    array_push(self::$formErrors, array(
      'element' => $element,
      'error' => $error,
    )
    );
  }

  /**
   * Set results for mock managed file query.
   *
   * @param array $results
   *   An array of key/value pairs for the mock query.
   */
  public static function setManagedFileQuery($results) {
    self::$managedFiles = $results;
  }

  /**
   * Mock version of managed file query.
   *
   * @param string $uri
   *   The URI being sought.
   */
  public static function managedFileQuery($uri) {
    return self::$managedFiles[$uri];
  }

  /**
   * Set results for mock file load.
   *
   * @param array $results
   *   An array of key/object pairs for the mock file load.
   */
  public static function setManagedFileLoadResults($results) {
    self::$managedFileObjects = $results;
  }

  /**
   * Mock version of file_load.
   *
   * @param integer $fid
   *   The fie ID being sought.
   */
  public static function fileLoad($fid) {
    return self::$managedFileObjects[$fid];
  }

}
