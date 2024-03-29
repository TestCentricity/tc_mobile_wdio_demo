

When(/^I type text into the input field$/) do
  form_screen.enter_text
end


Then(/^I expect what I typed to be displayed in the result field$/) do
  form_screen.verify_text_entry
end


When(/^I turn the switch (.*)$/) do |state|
  form_screen.set_switch_state(state)
end


Then(/^I expect the switch (.*) state to be correctly displayed$/) do |state|
  form_screen.verify_switch_state(state)
end

When(/^I tap the Active button$/) do
  form_screen.active_button_tap
end


When(/^I (.*) the drop\-down menu$/) do |action|
  case action.downcase.to_sym
  when :open
    form_screen.invoke_drop_menu
  when :close, :dismiss
    form_screen.dismiss_drop_menu
  else
    raise "#{action} is not a valid selector"
  end
end


Then(/^I expect the drop\-down menu to be correctly displayed$/) do
  form_screen.verify_drop_menu(visible = true)
end


Then(/^I expect the drop\-down menu to be closed$/) do
  form_screen.verify_drop_menu(visible = false)
end

When(/^I select an item in the menu by its (.*)$/) do |method|
  form_screen.select_drop_menu_item(method)
end


Then(/^I expect the menu selection to be correctly displayed$/) do
  form_screen.verify_menu_selection
end
