<?php

namespace Acquia\govCMSExtension\MediaBrowserContext;

use Behat\Mink\Exception\ElementNotFoundException;
use Drupal\DrupalExtension\Context\DrupalSubContextBase;
use Drupal\DrupalExtension\Context\MinkContext;

/**
 * Contains step definitions for working with media browsers.
 */
class MediaBrowserContext extends DrupalSubContextBase {

  /**
   * The Mink context.
   *
   * @var MinkContext
   */
  protected $minkContext;

  /**
   * Gathers required contexts.
   *
   * @BeforeScenario
   */
  public function gatherContexts() {
    $this->minkContext = $this->getContext(MinkContext::class);
  }

  /**
   * Submits the media browser.
   *
   * @When I submit the media browser
   */
  public function submit() {
    $session = $this->getSession();

    $this->minkContext->pressButton('Save');
    $session->switchToWindow();
    $this->minkContext->iWaitForAjaxToFinish();
  }

  /**
   * Opens an media browser for a particular field.
   *
   * @param string $field
   *   The field label.
   *
   * @throws \Exception
   *   If the collapsible field element does not exist on the page.
   *
   * @When I open the :field media browser
   */
  public function openMediaBrowser($field) {
    $session = $this->getSession();

    $element = $session->getPage()->findById($field);
    if (empty($element)) {
      throw new \Exception(sprintf('Failed to find the element with id "%s"', $field));
    }
    $link = $element->findLink('Browse');
    if (empty($link)) {
      throw new \Exception(sprintf('Failed to find the media browser for the field with id "%s"', $field));
    }
    $link->click();
    $this->minkContext->iWaitForAjaxToFinish();
    $session->switchToIFrame('mediaBrowser');
    // This might be vestigial.
    sleep(10);
  }

  /**
   * Selects an item in an media browser view.
   *
   * @param int $n
   *   The one-based index of the item to select.
   * @param string $browser_id
   *   (optional) The media browser ID.
   *
   * @When I select item :n
   * @When I select item :n from the media browser
   * @When I select item :n from the :browser_id media browser
   */
  public function selectItem($n, $browser_id = NULL) {
    if ($browser_id) {
      $selector = 'form#media-browser-' . drupal_clean_css_identifier($browser_id) . '-form';
    }
    else {
      $selector = 'form[data-media-browser-uuid]';
    }

    /** @var \Behat\Mink\Element\NodeElement[] $items */
    $items = $this
      ->assertSession()
      ->elementExists('css', $selector)
      ->findAll('css', '[data-selectable]');

    $items[$n - 1]->click();
  }

}
