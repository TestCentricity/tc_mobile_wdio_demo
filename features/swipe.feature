@mobile @ios @android @regression


Feature:  Swipe
  In order to ensure comprehensive support for mobile touch gestures
  As a developer of the TestCentricity Mobile gem
  I expect to validate that swipe and scroll gestures are supported


  Background:
    Given I have launched the WDIO Demo app
    And I am on the Swipe screen

@bat
  Scenario:  Verify horizontal scrolling gestures
    Then I expect the Swipe screen to be correctly displayed


  Scenario:  Verify vertical scrolling gestures
    When I scroll down
    Then I should see the hidden image
    When I scroll up
    Then I should not see the hidden image
