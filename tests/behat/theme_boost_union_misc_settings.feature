@theme @theme_boost_union @theme_boost_union_misc_settings
Feature: Configuring the theme_boost_union plugin for the "Miscellaneous" tab
  In order to use the features
  As admin
  I need to be able to configure the theme Boost Union plugin

  Scenario: Enable the JavaScript disabled hint (and make sure it is shown when JavaScript is disabled)
    Given the following config values are set as admin:
      | config                 | value | plugin            |
      | javascriptdisabledhint | yes   | theme_boost_union |
    When I log in as "admin"
    Then "#javascriptdisabledhint" "css_element" should exist
    And I should see "JavaScript is disabled in your browser" in the "#javascriptdisabledhint" "css_element"

  @javascript
  Scenario: Enable the JavaScript disabled hint (and make sure it is not shown when JavaScript is enabled)
    Given the following config values are set as admin:
      | config                 | value | plugin            |
      | javascriptdisabledhint | yes   | theme_boost_union |
    When I log in as "admin"
    Then "#javascriptdisabledhint" "css_element" should not exist

  Scenario: Disable the JavaScript disabled hint (and make sure it is not shown when JavaScript is disabled)
    Given the following config values are set as admin:
      | config                 | value | plugin            |
      | javascriptdisabledhint | no    | theme_boost_union |
    When I log in as "admin"
    Then "#javascriptdisabledhint" "css_element" should not exist
