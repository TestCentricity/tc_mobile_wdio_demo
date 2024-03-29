class FormScreen < BaseWDIODemoAppScreen
  include SharedFormScreen

  trait(:screen_name)    { 'Form' }
  trait(:screen_locator) { { accessibility_id: 'Forms-screen' } }
  trait(:navigator)      { go_to_forms }

  # Form screen UI elements
  textfield :input_field,     { accessibility_id: 'text-input' }
  switch    :toggle_switch,   { accessibility_id: 'switch' }
  element   :drop_down_field, { accessibility_id: 'text_input' }
  buttons   active_button:    { accessibility_id: 'button-Active' },
            inactive_button:  { accessibility_id: 'button-Inactive' },
            close_drop_menu:  { accessibility_id: 'done_button' }
  list      :drop_down_menu,  { xpath: '//XCUIElementTypePicker[@name="Dropdown picker"]/XCUIElementTypePickerWheel' }
  labels    header_label:     { xpath: '//XCUIElementTypeStaticText[@name="Form components"]' },
            typed_value:      { accessibility_id: 'input-text-result' },
            switch_state:     { accessibility_id: 'switch-text' }

  def verify_drop_menu(visible)
    ui = if visible
           {
             drop_down_menu => {
               visible: true,
               enabled: true
             },
             close_drop_menu => {
               visible: true,
               enabled: true,
               caption: 'Done'
             }
           }
         else
           {
             drop_down_menu => { visible: false },
             close_drop_menu => { visible: false }
           }
         end
    verify_ui_states(ui)
  end

  def dismiss_drop_menu
    close_drop_menu.click
  end

  def select_drop_menu_item(method)
    raise 'Cannot select PickerWheel items by index' if method.downcase.to_sym == :index
    drop_down_menu.wait_until_visible(5)
    drop_down_menu.choose_item('Appium is awesome')
    close_drop_menu.click
    drop_down_menu.wait_until_hidden(5)
  end
end
