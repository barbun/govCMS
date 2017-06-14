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
        2 => array(
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
      2 => array(
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
          2 => array(
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
          'foo',
        ),
      ),
      'storage' => array(
        'iconomist_num_icons' => 2,
        'iconomist_icons' => array(
          0 => array(
            'usage_id' => 2,
            'path' => 'public://iconomist/test1.jpg',
          ),
          2 => array(
            'usage_id' => 3,
            'path' => 'public://iconomist/test2.jpg',
          ),
        ),
      ),
    );
    $this->assertEquals($expected, $form_state);
  }

  /**
   * Form_system_theme_settings_alter doesn't reload state if Ajax call.
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
      'triggering_element' => 'bar',
    );

    $expected = $form_state;
    $expected += array(
      'storage' => array(
        'iconomist_num_icons' => 0,
      ),
    );

    IconomistTest::themeSettingsAlter($form, $form_state);

    $this->assertEquals($expected, $form_state);
  }

  /**
   * Form_system_theme_settings_alter adds the toggle_iconomist checkbox.
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
   * Form_system_theme_settings_alter adds Iconomist Settings fieldset.
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
   * Form_system_theme_settings_alter adds container for Ajax commands.
   *
   * @test
   */
  public function addsAjaxContainer() {
    $form = [];
    $form_state = [];

    IconomistTest::themeSettingsAlter($form, $form_state);

    $this->assertArrayHasKey('iconomist_icons', $form['iconomist']);
    $form['iconomist']['iconomist_icons'] = array(
      '#type' => 'container',
      '#tree' => TRUE,
      '#prefix' => '<div id="iconomist-icons">',
      '#suffix' => '</div>',
    );
  }

  /**
   * Form_system_theme_settings_alter adds a fieldset for each icon.
   *
   * @test
   */
  public function addsFieldsetForEachIcon() {
    $form = [];
    $form_state = [];

    // The link rel types.
    $relationships = array(
      'apple-touch-icon' => t('Apple Touch'),
      'apple-touch-icon-precomposed' => t('Apple Touch (Precomposed)'),
      'icon' => t('Icon'),
    );

    // The theme argument should be used too.
    $form_state['build_info']['args'] = ['foo'];

    IconomistTest::themeSettingsAlter($form, $form_state);

    $expected = count(self::$settings['foo']['iconomist_icons']);

    for ($i = 0; $i < $expected; $i++) {
      $this->assertArrayHasKey($i, $form['iconomist']['iconomist_icons']);
      $actual = $form['iconomist']['iconomist_icons'][$i];

      $expectedIcon = self::$settings['foo']['iconomist_icons'][$i];
      $expectedFieldset = array(
        '#type' => 'fieldset',
        '#title' => t('Icon'),
        '#element_validate' => ['_iconomist_icons_validate'],
        'usage_id' => array(
          '#type' => 'value',
          '#value' => $expectedIcon['usage_id'] ?: "",
        ),
        'upload' => array(
          '#type' => 'managed_file',
          '#title' => t('Upload icon image'),
          '#description' => t("If you don't have direct file access to the server, use this field to upload your touch icon."),
          '#upload_validators' => ['file_validate_is_image'],
          '#upload_location' => 'public://iconomist',
        ),
        'path' => array(
          '#type' => 'textfield',
          '#default_value' => $expectedIcon['path'] ?: "",
          '#title' => t('Path to custom icon'),
          '#description' => t('The path to the file you would like to use as your icon.'),
        ),
        'width' => array(
          '#type' => 'textfield',
          '#default_value' => $expectedIcon['width'] ?: "",
          '#title' => t('Icon width'),
          '#description' => t('Width of icon in pixels.'),
          '#element_validate' => ['element_validate_integer_positive'],
          '#size' => 10,
        ),
        'height' => array(
          '#type' => 'textfield',
          '#default_value' => $expectedIcon['height'] ?: "",
          '#title' => t('Icon height'),
          '#description' => t('Height of icon in pixels.'),
          '#element_validate' => ['element_validate_integer_positive'],
          '#size' => 10,
        ),
        'rel' => array(
          '#type' => 'radios',
          '#options' => $relationships,
          '#default_value' => $expectedIcon['rel'] ?: "icon",
          '#title' => t('Icon relationship'),
          '#description' => t('Relationship type of icon.'),
        ),
        'remove_icon' => array(
          '#type' => 'submit',
          '#name' => 'remove_icon_' . $i,
          '#submit' => ['_iconomist_remove_icon'],
          '#value' => t('Remove icon'),
          '#ajax' => array(
            'callback' => '_iconomist_ajax_callback',
            'wrapper' => 'iconomist-icons',
          ),
          '#limit_validation_errors' => array(),
        ),
      );
      $this->assertEquals($expectedFieldset, $actual);
    }
  }

  /**
   * Form_system_theme_settings_alter always displays the 'Add icon' button.
   *
   * @test
   */
  public function alwaysDisplaysAddIconButton() {
    $form = [];
    $form_state = [];

    $expected = array(
      '#type' => 'submit',
      '#name' => 'add_icon',
      '#submit' => ['_iconomist_add_icon'],
      '#value' => t('Add icon'),
      '#ajax' => array(
        'callback' => '_iconomist_ajax_callback',
        'wrapper' => 'iconomist-icons',
      ),
      '#limit_validation_errors' => array(),
    );

    IconomistTest::themeSettingsAlter($form, $form_state);

    // Sitewide (empty) form should have it.
    $this->assertEquals($expected, $form['iconomist']['add_icon']);

    // A form with a couple of icons already existing should also still have the
    // icon.
    $form_state = array();
    $form_state['build_info']['args'] = ['foo'];
    IconomistTest::themeSettingsAlter($form, $form_state);
    $this->assertEquals($expected, $form['iconomist']['add_icon']);
  }

  /**
   * Form_system_theme_settings_alter adds submit handler to head of list.
   *
   * @test
   */
  public function addsSubmitHandlerAtHeadOfList() {
    $form = array(
      '#submit' => array(
        'iwasfirst',
        'iwaslast',
      ),
    );
    $form_state = [];

    $expected = array(
      '_iconomist_settings_submit',
      'iwasfirst',
      'iwaslast',
    );

    IconomistTest::themeSettingsAlter($form, $form_state);
    $this->assertEquals($expected, $form['#submit']);
  }

  /**
   * Add_icon ajax callback increases no. of icons and triggers form rebuild.
   *
   * @test
   */
  public function ajaxCallbackIncreasesNumberOfIconsAndTriggersFormRebuild() {
    $form = array();
    $form_state = array();

    $expected = array(
      'rebuild' => TRUE,
      'storage' => array(
        'iconomist_num_icons' => 1,
      ),
    );

    // From empty to one.
    IconomistTest::addIcon($form, $form_state);
    $this->assertEquals($expected, $form_state);

    // From 2 to 3.
    $form_state['build_info']['args'] = ['foo'];
    IconomistTest::themeSettingsAlter($form, $form_state);
    IconomistTest::addIcon($form, $form_state);

    $actual = $form_state['storage']['iconomist_num_icons'];
    $this->assertEquals(3, $actual);
  }

  /**
   * Remove_icon removes the appropriate icon from the form state.
   *
   * @test
   */
  public function ajaxRemoveIconCallbackRemovesIconFromFormState() {
    // Get the initial form.
    $form = array();
    $form_state['build_info']['args'] = ['foo'];
    IconomistTest::themeSettingsAlter($form, $form_state);

    // Adjust the form state to emulate having the remove button pressed.
    $form_state['triggering_element']['#name'] = 'remove_icon_0';
    IconomistTest::removeIcon($form, $form_state);

    $expected = array(
      'build_info' => array(
        'args' => array(
          0 => 'foo',
        ),
      ),
      'values' => array(
        'iconomist_icons' => array(
          0 => array(
            'usage_id' => 3,
            'path' => 'public://iconomist/test2.jpg',
            'width' => '64',
            'height' => '64',
            'rel' => 'icon',
            'fid' => '22',
          ),
        ),
      ),
      'storage' => array(
        'iconomist_num_icons' => 1,
        'iconomist_icons' => array(
          0 => array(
            'path' => 'public://iconomist/test2.jpg',
            'usage_id' => 3,
          ),
        ),
      ),
      'triggering_element' => array(
        '#name' => 'remove_icon_0',
      ),
      'rebuild' => TRUE,
      'input' => array(
        'iconomist_icons' => NULL,
      ),
    );

    $this->assertEquals($expected, $form_state);
  }

  /**
   * Ajax_callback returns the portion of the render array needed.
   *
   * @test
   */
  public function ajaxCallbackReturnsRenderArray() {
    $form = array(
      'iconomist' => array(
        'iconomist_icons' => array(
          'test' => TRUE,
        ),
      ),
    );
    $form_state = array();

    $result = IconomistTest::ajaxCallback($form, $form_state);

    $expected = array('test' => TRUE);
    $this->assertEquals($expected, $result);
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
