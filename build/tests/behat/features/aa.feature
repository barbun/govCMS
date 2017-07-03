@javascript
Feature: Testing breakage

  Test breakage with javascript enabled

  Scenario: Break on purpose
    When I visit "/"
    Then I should see "dummy text"
