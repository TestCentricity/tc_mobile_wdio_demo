@mobile @ios @android @regression


Feature:  Drag and Drop
  In order to ensure comprehensive support for mobile touch gestures
  As a developer of the TestCentricity Mobile gem
  I expect to validate that individual UI elements can be dragged and dropped


  Background:
    Given I have launched the WDIO Demo app
    And I am on the Drag and Drop screen


  Scenario:  Verify unsolved puzzle display
    Then I expect the Drag and Drop screen to be correctly displayed


  Scenario:  Verify dragging puzzle piece to empty space is blocked
    When I drag a puzzle piece to an empty space
    Then I expect the puzzle piece to return to its original position

@bat
  Scenario:  Verify dragging puzzle piece to wrong slot is blocked
    When I drag a puzzle piece to the wrong slot
    Then I expect the puzzle piece to return to its original position


  Scenario:  Verify puzzle piece can be dragged to correct slot
    When I drag a puzzle piece to the correct slot
    Then I expect the puzzle piece to by remain in its target slot

@bat
  Scenario:  Verify puzzle solution
    When I correctly solve the puzzle
    Then I expect to see the congratulations message
    When I retry the puzzle
    Then I expect the Drag and Drop screen to be correctly displayed
