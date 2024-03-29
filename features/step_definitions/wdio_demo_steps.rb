

Given(/^I have launched the WDIO Demo app$/) do
  AppiumConnect.activate_app
  base_app_screen.verify_screen_exists
end


Then(/^I should( not)? see the hidden image$/) do |negate|
  swipe_screen.verify_image_visibility(visibility = !negate)
end


When(/^I scroll (.*)$/) do |direction|
  direction = direction.downcase.to_sym
  case direction
  when :up, :down
    swipe_screen.swipe_vertical(direction)
  when :left, :right
    swipe_screen.swipe_horizontal(direction)
  else
    raise "#{direction} is not a supported selector"
  end
end
