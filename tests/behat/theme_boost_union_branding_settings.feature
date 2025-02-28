@theme @theme_boost_union @theme_boost_union_branding_settings
Feature: Configuring the theme_boost_union plugin for the "Branding" tab
  In order to use the features
  As admin
  I need to be able to configure the theme Boost Union plugin

  Background:
    Given the following "users" exist:
      | username |
      | student1 |
      | teacher1 |
    And the following "courses" exist:
      | fullname | shortname |
      | Course 1 | C1        |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
      | student1 | C1     | student        |

  @javascript @_file_upload
  Scenario: Upload a custom favicon
    When I log in as "admin"
    And I navigate to "Appearance > Boost Union" in site administration
    And I click on "Branding" "link"
    And I upload "theme/boost_union/tests/fixtures/favicon.ico" file to "Favicon" filemanager
    And I press "Save changes"
    # We can't check the uploaded favicon visually, but we can verify that the site's favicon is not shipped by pluginfile.php (for uploaded files) and not by theme/image.php (for image files from disk) anymore.
    Then "//head//link[contains(@rel, 'shortcut')][contains(@href, 'pluginfile.php/1/theme_boost_union/favicon')][contains(@href, 'favicon.ico')]" "xpath_element" should exist
    And "//head//link[contains(@rel, 'shortcut')][contains(@href, 'theme/image.php/boost_union/theme')][contains(@href, 'favicon')]" "xpath_element" should not exist

  @javascript @_file_upload
  Scenario: Do not upload a custom favicon (countercheck)
    When I log in as "admin"
    Then "//head//link[contains(@rel, 'shortcut')][contains(@href, 'theme/image.php/boost_union/theme')][contains(@href, 'favicon')]" "xpath_element" should exist
    And "//head//link[contains(@rel, 'shortcut')][contains(@href, 'pluginfile.php/1/theme_boost_union/favicon')][contains(@href, 'favicon.ico')]" "xpath_element" should not exist
