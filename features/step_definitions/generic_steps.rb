include TestCentricity


When(/^I (?:load|am on) the (.*) screen$/) do |screen_name|
  # find and load the specified target screen
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.load_screen
end


When(/^I (?:click|tap) the ([^\"]*) navigation menu item$/) do |screen_name|
  # find and navigate to the specified target screen
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.navigate_to
  ScreenManager.current_screen = target_screen
end


Then(/^I expect the (.*) screen to be correctly displayed$/) do |screen_name|
  # find and verify that the specified target screen is loaded
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.verify_screen_exists
  # verify that target screen is correctly displayed
  target_screen.verify_screen_ui
end


Then(/^I expect an error to be displayed due to (.*)$/) do |reason|
  ScreenManager.current_screen.verify_entry_error(reason)
end


When(/^I (.*) the popup request modal$/) do |action|
  ScreenManager.current_screen.modal_action(action)
end


Then(/^the popup request modal should( not)? be visible$/) do |negate|
  ScreenManager.current_screen.verify_modal_state(visible = !negate)
end


def empty_cart
  # ensure Shopping Cart is empty
  CartData.current = nil
  begin
    products_screen.wait_until_exists(2)
  rescue
    logout
    products_screen.load_screen
  end
  base_app_screen.clear_app_data
end

def login
  begin
    login_screen.load_screen
  rescue
    logout
  end
  login_screen.login
end

def logout
  ScreenManager.current_screen = base_app_screen if ScreenManager.current_screen.nil?
  ScreenManager.current_screen.invoke_nav_menu
  ScreenManager.current_screen.nav_menu.open_log_out
  ScreenManager.current_screen.modal_action('accept')
  login_screen.verify_screen_exists
end
