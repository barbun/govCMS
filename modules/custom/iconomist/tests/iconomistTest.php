<?php

/**
 * @file
 * PHP unit tests for Iconomist.
 */

require_once 'iconomist.test.class.php';

/**
 * Test cases for Iconomist module.
 */
class IconomistPHPUnitTests extends \PHPUnit_Framework_TestCase {

  static public $settings = array(
    '' => array(
      'toggle_iconomist' => FALSE,
    ),
    'foo' => array(
      'toggle_iconomist' => TRUE,
      'iconomist_icons' => array(
        0 => array(
          'usage_id' => 2,
          'path' => 'public://iconomist/test1.jpg',
          'width' => '',
          'height' => '',
          'rel' => 'icon',
          'fid' => '21',
        ),
        1 => array(
          'usage_id' => 3,
          'path' => 'public://iconomist/test2.jpg',
          'width' => '64',
          'height' => '64',
          'rel' => 'icon',
          'fid' => '22',
        ),
      ),
    ),
  );

  /**
   * Setup function for tests.
   */
  public function setUp() {

    IconomistTest::themeSetSettings(self::$settings);
  }

  /**
   * Iconomist_form_system_theme_settings_alter implements sitewide settings.
   *
   * @test
   */
  public function implementsSitewideSettings() {
    $form = array();
    $form_state = array();

    IconomistTest::themeSettingsAlter($form, $form_state);
    unset($form_state['add_icon']);
    unset($form_state['iconomist_icons']);

    // If sitewide settings are properly implemented, they should be reflected
    // in changes to the form_state array...
    $expected = array(
      'values' => array(
        'iconomist_icons' => array(),
      ),
      'storage' => array(
        'iconomist_num_icons' => 0,
      ),
    );
    $this->assertEquals($expected, $form_state);

    // ... and in the form's render array.
    // @TODO Move this below where we test the elements are set.
    $toggle = $form['theme_settings']['toggle_iconomist'];
    $this->assertEquals(FALSE, $toggle['#default_value']);
  }

  /**
   * Iconomist_form_system_theme_settings_alter implements settings per theme.
   *
   * @test
   */
  public function implementsSettingsPerTheme() {
    $form = array();
    $form_state = array(
      'values' => array(
        'iconomist_icons' => array(
          0 => array(
            'usage_id' => 2,
            'path' => 'public://iconomist/test1.jpg',
            'width' => '',
            'height' => '',
            'rel' => 'icon',
            'fid' => '21',
          ),
          1 => array(
            'usage_id' => 3,
            'path' => 'public://iconomist/test2.jpg',
            'width' => '64',
            'height' => '64',
            'rel' => 'icon',
            'fid' => '22',
          ),
        ),
      ),
    );

    // Set the name of the 'theme' we're using.
    $form_state['build_info']['args'] = array('foo');

    IconomistTest::themeSettingsAlter($form, $form_state);

    $expected = array(
      0 => array(
        'path' => 'public://iconomist/test1.jpg',
        'usage_id' => '2',
      ),
      1 => array(
        'path' => 'public://iconomist/test2.jpg',
        'usage_id' => '3',
      ),
    );
    $this->assertEquals($expected, $form_state['storage']['iconomist_icons']);

    $toggle = $form['theme_settings']['toggle_iconomist'];
    $this->assertEquals(TRUE, $toggle['#default_value']);
  }

  /**
   * Iconomist_form_system_theme_settings_alter loads the form state correctly.
   *
   * @test
   */
  public function loadsStateWhenNoTriggeringElement() {
    $form = array();
    $form_state = array(
      'build_info' => array(
        'args' => array(
          'foo',
        ),
      ),
    );

    IconomistTest::themeSettingsAlter($form, $form_state);

    $expected = array(
      'values' => array(
        'iconomist_icons' => array(
          0 => array(
            'usage_id' => 2,
            'path' => 'public://iconomist/test1.jpg',
            'width' => '',
            'height' => '',
            'rel' => 'icon',
            'fid' => '21',
          ),
          1 => array(
            'usage_id' => 3,
            'path' => 'public://iconomist/test2.jpg',
            'width' => '64',
            'height' => '64',
            'rel' => 'icon',
            'fid' => '22',
          ),
        ),
      ),
      'build_info' => array(
        'args' => array(
          'foo'
        ),
      ),
      'storage' => array(
        'iconomist_num_icons' => 2,
        'iconomist_icons' => array(
          0 => array(
            'usage_id' => 2,
            'path' => 'public://iconomist/test1.jpg',
          ),
          1 => array(
            'usage_id' => 3,
            'path' => 'public://iconomist/test2.jpg',
          ),
        )
      )
    );
    $this->assertEquals($expected, $form_state);
  }

  /**
   * form_system_theme_settings_alter doesn't reload state if Ajax call.
   *
   * @test
   */
  public function noStateLoadWhenTriggeringElementSet() {
    $form = array();
    $form_state = array(
      'build_info' => array(
        'args' => array(
          'foo',
        ),
      ),
      'triggering_element' => 'foo',
    );

    IconomistTest::themeSettingsAlter($form, $form_state);

    $expected = array(
      'values' => array(
        'iconomist_icons' => array(
          0 => array(
            'usage_id' => 2,
            'path' => 'public://iconomist/test1.jpg',
            'width' => '',
            'height' => '',
            'rel' => 'icon',
            'fid' => '21',
          ),
          1 => array(
            'usage_id' => 3,
            'path' => 'public://iconomist/test2.jpg',
            'width' => '64',
            'height' => '64',
            'rel' => 'icon',
            'fid' => '22',
          ),
        ),
      ),
      'build_info' => array(
        'args' => array(
          'foo'
        ),
      ),
      'storage' => array(
        'iconomist_num_icons' => 2,
        'iconomist_icons' => array(
          0 => array(
            'usage_id' => 2,
            'path' => 'public://iconomist/test1.jpg',
          ),
          1 => array(
            'usage_id' => 3,
            'path' => 'public://iconomist/test2.jpg',
          ),
        )
      )
    );
    $this->assertEquals($expected, $form_state);
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
    $form = [];
    $form_state = [];

    // The theme argument should be used too.
    $form_state['build_info']['args'] = ['foo'];

    IconomistTest::themeSettingsAlter($form, $form_state);

    $expected = count(self::$settings['foo']['iconomist_icons']);

    $this->assertEquals($expected, $form_state['storage']['iconomist_num_icons']);
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
    $this->assertEquals(true, false);
  }

  /**
   * iconomist_form_system_theme_settings_alter always displays the 'Add icon' button and associated label in the Iconomist Settings fieldset, configured to invoke the Ajax callback.
   *
   * @test
   */
  public function alwaysDisplaysAddIconButton() {
    $this->assertEquals(true, false);
  }

  /**
   * iconomist_add_icon (the Ajax callback) increases the number of icons and triggers a form rebuild.
   *
   * @test
   */
  public function ajaxCallbackIncreasesNumberOfIconsAndTriggersFormRebuild() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_remove_icon removes the appropriate icon from the form state.
   *
   * @test
   */
  public function ajaxRemoveIconCallbackRemovesIconFromFormState() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_ajax_callback returns the portion of the render array needed for the ajax callback.
   *
   * @test
   */
  public function ajaxCallbackReturnsRenderArray() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_get_managed_file returns the appropriate file object when given a valid URI.
   *
   * @test
   */
  public function getManagedFileReturnsAppropriateFileObject() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_get_managed_file returns FALSE when given an invalid URI.
   *
   * @test
   */
  public function getManagedFileReturnsFalseForInvalidUri() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_get_usage_id does not return the same usage_id twice.
   *
   * @test
   */
  public function getUsageIdDoesNotReturnSameUsageIdTwice() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_get_usage_id returns an integer.
   *
   * @test
   */
  public function getUsageIdReturnsInteger() {
    $this->assertEquals(true, false);
  }

  /**
   *_iconomist_icons_validate honours the #limit_validation_errors element.
   *
   * @test
   */
  public function validateHonoursTheLimitValidationErrorsElement() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_icons_validate sets a 'Path is invalid' form error on the path field when given an invalid file path.
   *
   * @test
   */
  public function validateSetsPathIsInvalidErrorForInvalidPaths() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_icons_validate sets the file ID when a valid file path is provided.
   *
   * @test
   */
  public function validateSetsFileIdForValidPaths() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_icons_validate sets a 'Upload failed' form error on the upload field when given an invalid file path.
   *
   * @test
   */
  public function validateSetsUploadFailedErrorForInvalidFilePath() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_icons_validate sets the file ID when a valid file upload is provided.
   *
   * @test
   */
  public function validateSetsFileIdForValidFileUploadPath() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_icons_validate removes a file upload without flagging an error when no file is specified.
   *
   * @test
   */
  public function validateRemovesFileUploadAndGivesNoErrorWhenNoFileChosen() {
    $this->assertEquals(true, false);
  }

  /**
   *  _iconomist_icons_validate removes file usage when the file is changed.
   *
   * @test
   */
  public function validateRemovesFileUsageWhenFileChanged() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_settings_submit correctly removes file usage for files that are no longer in use by iconomist.
   *
   * @test
   */
  public function submitRemovesFileUsageForFilesNoLongerInUse() {
    $this->assertEquals(true, false);
  }

  /**
   * _iconomist_settings_submit correctly persists file usage for files that are newly in use by iconomist.
   *
   * @test
   */
  public function submitPersistsFileUsageForFilesNewlyInUse() {
    $this->assertEquals(true, false);
  }

  /**
   * iconomist_preprocess_html adds all chosen icons to the html head.
   *
   * @test
   */
  public function preprocessHmlAddsChosenIconsToHtmlHead() {
    $this->assertEquals(true, false);
  }

  /**
   * iconomist_preprocess_html applies all applicable attributes of the chosen icons.
   *
   * @test
   */
  public function preprocessHtmlAppliesAllApplicableAttributesToChosenIcons() {
    $this->assertEquals(true, false);
  }

}
