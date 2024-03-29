

When(/^I drag a puzzle piece to the (.*) slot$/) do |slot|
  case slot.downcase.to_sym
  when :wrong
    drag_drop_screen.drag_to_wrong_slot
  when :correct
    drag_drop_screen.drag_to_correct_slot
  else
    raise "#{slot} is not a valid selector"
  end
end


When(/^I drag a puzzle piece to an empty space$/) do
  drag_drop_screen.drag_to_empty_space
end


Then(/^I expect the puzzle piece to return to its original position$/) do
  drag_drop_screen.verify_drag_blocked
end


Then(/^I expect the puzzle piece to by remain in its target slot$/) do
  drag_drop_screen.verify_drag_success
end


When(/^I correctly solve the puzzle$/) do
  drag_drop_screen.solve_puzzle
end


Then(/^I expect to see the congratulations message$/) do
  drag_drop_screen.verify_puzzle_solved
end


When(/^I retry the puzzle$/) do
  drag_drop_screen.retry
end
