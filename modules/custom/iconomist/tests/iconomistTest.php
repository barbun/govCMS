<?php

/**
 * @file
 * PHP unit tests for Iconomist.
 */

use PHPUnit\Framework\TestCase;

require_once 'iconomist.test.class.php';

/**
 * Test cases for Iconomist module.
 */
class IconomistPHPUnitTests extends \PHPUnit_Framework_TestCase {

  /**
   * Setup function for tests.
   */
  public function setUp()
  {
    $settings = array(
      '' => array(
        'toggle_iconomist' => FALSE,
      ),
      'foo' => array(
        'toggle_iconomist' => TRUE,
      ),
    );
    IconomistTest::themeSetSettings($settings);
  }

  /**
   * Teardown function for tests.
   */
  public function tearDown()
  {

  }

  /**
   * Iconomist_form_system_theme_settings_alter adds the toggle_iconomist checkbox to the 'Toggle display' frameset.
   *
   * @test
   */
  public function addsToggleDisplay() {
    $form = array();
    $form_state = array();

    // The theme argument should be used too.
    $form_state['build_info']['args'] = array('foo');

    IconomistTest::themeSettingsAlter($form, $form_state);

    $expected = array(
      '#type' => 'checkbox',
      '#title' => t('Iconomist Icons'),
      '#default_value' => TRUE,
    );
    $this->assertEquals($expected, $form['theme_settings']['toggle_iconomist']);
  }

  /**
   * Iconomist_form_system_theme_settings_alter adds the Iconomist Settings fieldset to the form.
   *
   * @test
   */
  public function addsIconomistSettingsFieldset() {
    $form = [];
    $form_state = [];

    // The theme argument should be used too.
    $form_state['build_info']['args'] = ['foo'];

    IconomistTest::themeSettingsAlter($form, $form_state);

    $expected = array(
      '#type' => 'fieldset',
      '#title' => t('Iconomist settings'),
      '#description' => t('Additional icons to link to in HTML head.'),
    );

    // Remove the extra parts we also expect and will test for below.
    unset($form['iconomist']['iconomist_icons']);
    unset($form['iconomist']['add_icon']);
    $this->assertEquals($expected, $form['iconomist']);
  }

/**
 * iconomist_form_system_theme_settings_alter adds a fieldset for each icon to the Iconomist Settings fieldset.
   *
   * @test
   */
  public function addsFieldsetForEachIcon() {

  }

  /**
   * For each icon, iconomist_form_system_theme_settings_alter:
   * - adds fields for the icon type, icon path / upload, dimensions and relationship
   * - populates the field defaults on the previous line with any currently saved values
   * - adds a 'Remove' button configured to invoke an Ajax callback and pass which delta is being removed
   *
   * @test
   */
  public function addsFieldsForEachIcon() {

  }

  /**
   * iconomist_form_system_theme_settings_alter always displays the 'Add icon' button and associated label in the Iconomist Settings fieldset, configured to invoke the Ajax callback.
   *
   * @test
   */
  public function alwaysDisplaysAddIconButton() {

  }

  /**
   * iconomist_add_icon (the Ajax callback) increases the number of icons and triggers a form rebuild.
   *
   * @test
   */
  public function ajaxCallbackIncreasesNumberOfIconsAndTriggersFormRebuild() {

  }

  /**
   * _iconomist_remove_icon removes the appropriate icon from the form state.
   *
   * @test
   */
  public function ajaxRemoveIconCallbackRemovesIconFromFormState() {

  }

  /**
   * _iconomist_ajax_callback returns the portion of the render array needed for the ajax callback.
   *
   * @test
   */
  public function ajaxCallbackReturnsRenderArray() {

  }

  /**
   * _iconomist_get_managed_file returns the appropriate file object when given a valid URI.
   *
   * @test
   */
  public function getManagedFileReturnsAppropriateFileObject() {

  }

  /**
   * _iconomist_get_managed_file returns FALSE when given an invalid URI.
   *
   * @test
   */
  public function getManagedFileReturnsFalseForInvalidUri() {

  }

  /**
   * _iconomist_get_usage_id does not return the same usage_id twice.
   *
   * @test
   */
  public function getUsageIdDoesNotReturnSameUsageIdTwice() {

  }

  /**
   * _iconomist_get_usage_id returns an integer.
   *
   * @test
   */
  public function getUsageIdReturnsInteger() {

  }

  /**
   *_iconomist_icons_validate honours the #limit_validation_errors element.
   *
   * @test
   */
  public function validateHonoursTheLimitValidationErrorsElement() {

  }

  /**
   * _iconomist_icons_validate sets a 'Path is invalid' form error on the path field when given an invalid file path.
   *
   * @test
   */
  public function validateSetsPathIsInvalidErrorForInvalidPaths() {

  }

  /**
   * _iconomist_icons_validate sets the file ID when a valid file path is provided.
   *
   * @test
   */
  public function validateSetsFileIdForValidPaths() {

  }

  /**
   * _iconomist_icons_validate sets a 'Upload failed' form error on the upload field when given an invalid file path.
   *
   * @test
   */
  public function validateSetsUploadFailedErrorForInvalidFilePath() {

  }

  /**
   * _iconomist_icons_validate sets the file ID when a valid file upload is provided.
   *
   * @test
   */
  public function validateSetsFileIdForValidFileUploadPath() {

  }

  /**
   * _iconomist_icons_validate removes a file upload without flagging an error when no file is specified.
   *
   * @test
   */
  public function validateRemovesFileUploadAndGivesNoErrorWhenNoFileChosen() {

  }

  /**
   *  _iconomist_icons_validate removes file usage when the file is changed.
   *
   * @test
   */
  public function validateRemovesFileUsageWhenFileChanged() {

  }

  /**
   * _iconomist_settings_submit correctly removes file usage for files that are no longer in use by iconomist.
   *
   * @test
   */
  public function submitRemovesFileUsageForFilesNoLongerInUse() {

  }

  /**
   * _iconomist_settings_submit correctly persists file usage for files that are newly in use by iconomist.
   *
   * @test
   */
  public function submitPersistsFileUsageForFilesNewlyInUse() {

  }

  /**
   * iconomist_preprocess_html adds all chosen icons to the html head.
   *
   * @test
   */
  public function preprocessHmlAddsChosenIconsToHtmlHead() {

  }

  /**
   * iconomist_preprocess_html applies all applicable attributes of the chosen icons.
   *
   * @test
   */
  public function preprocessHtmlAppliesAllApplicableAttributesToChosenIcons() {

  }

}
