@mobile @ios @android @regression


Feature:  Form Components
  In order to ensure comprehensive support for various UI form components
  As a developer of the TestCentricity Mobile gem
  I expect to verify the actions and states of UI form components


  Background:
    Given I have launched the WDIO Demo app
    And I am on the Form screen


  Scenario:  Verify default state of Form screen
    Then I expect the Form screen to be correctly displayed


  Scenario:  Verify text input
    When I type text into the input field
    Then I expect what I typed to be displayed in the result field

@bat
  Scenario:  Verify toggle switch
    When I turn the switch on
    Then I expect the switch on state to be correctly displayed
    When I turn the switch off
    Then I expect the switch off state to be correctly displayed


  Scenario:  Verify drop-down menu can be invoked and dismissed
    When I open the drop-down menu
    Then I expect the drop-down menu to be correctly displayed
    When I close the drop-down menu
    Then I expect the drop-down menu to be closed

@bat
  Scenario Outline:  Verify selection made from drop-menu
    When I open the drop-down menu
    And I select an item in the menu by its <method>
    Then I expect the menu selection to be correctly displayed

  Examples:
    |method |
    |text   |

@!ios
  Examples:
    |method |
    |index  |

@bat
  Scenario Outline:  Verify alert modal interactions
    When I tap the Active button
    Then the popup request modal should be visible
    And I <action> the popup request modal
    Then the popup request modal should not be visible

    Examples:
      |action  |
      |accept  |
      |dismiss |
