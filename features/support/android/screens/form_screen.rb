class FormScreen < BaseWDIODemoAppScreen
  include SharedFormScreen

  trait(:screen_name)    { 'Form' }
  trait(:screen_locator) { { accessibility_id: 'Forms-screen' } }
  trait(:navigator)      { go_to_forms }

  # Form screen UI elements
  textfield :input_field,     { accessibility_id: 'text-input' }
  switch    :toggle_switch,   { accessibility_id: 'switch' }
  element   :drop_down_field, { xpath: '//android.view.ViewGroup[@content-desc="Dropdown"]/android.view.ViewGroup/android.widget.EditText' }
  buttons   active_button:    { accessibility_id: 'button-Active' },
            inactive_button:  { accessibility_id: 'button-Inactive' }
  list      :drop_down_menu,  { id: 'com.wdiodemoapp:id/select_dialog_listview' }
  labels    header_label:     { xpath: '//android.widget.ScrollView[@content-desc="Forms-screen"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView' },
            typed_value:      { accessibility_id: 'input-text-result' },
            switch_state:     { accessibility_id: 'switch-text' }

  def initialize
    super
    # define the list item element for the Drop-down list object
    list_elements = { list_item: { xpath: '//android.widget.CheckedTextView' } }
    drop_down_menu.define_list_elements(list_elements)
  end

  def verify_drop_menu(visible)
    ui = if visible
           {
             drop_down_menu => {
               visible: true,
               enabled: true,
               itemcount: 4,
               items: ['Select an item...',
                       'webdriver.io is awesome',
                       'Appium is awesome',
                       'This app is awesome']
             }
           }
         else
           { drop_down_menu => { visible: false } }
         end
    verify_ui_states(ui)
  end

  def dismiss_drop_menu
    drop_down_menu.click
  end

  def select_drop_menu_item(method)
    item = case method.downcase.to_sym
           when :text
             'Appium is awesome'
           when :index
             3
           else
             raise "#{method} is not a valid selector"
           end
    drop_down_menu.wait_until_visible(5)
    drop_down_menu.choose_item(item)
    drop_down_menu.wait_until_hidden(5)
  end
end
