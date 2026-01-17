module SharedFormScreen
  attr_accessor :text_value

  def verify_screen_ui
    ui = {
      header_label => {
        visible: true,
        caption: { translate: 'wdio.form_screen.header' }
      },
      input_field => {
        visible: true,
        enabled: true,
        placeholder: { translate: 'wdio.form_screen.type_input' }
      },
      typed_value => {
        visible: true,
        caption: ''
      },
      toggle_switch => {
        visible: true,
        enabled: true,
        checked: false
      },
      switch_state => {
        visible: true,
        caption: { translate: 'wdio.form_screen.switch' }
      },
      drop_down_field => {
        visible: true,
        value: { translate: 'wdio.form_screen.drop_down' }
      },
      active_button => {
        visible: true,
        enabled: true,
        caption: { translate: 'wdio.form_screen.active' }
      },
      inactive_button => {
        visible: true,
        caption: { translate: 'wdio.form_screen.inactive' }
      },
      drop_down_menu => { visible: false }
    }
    verify_ui_states(ui)
  end

  def enter_text
    @text_value = Faker::Hipster.word
    input_field.wait_until_visible(5)
    input_field.set(@text_value)
  end

  def verify_text_entry
    ui = {
      input_field => {
        visible: true,
        enabled: true,
        value: @text_value
      },
      typed_value => {
        visible: true,
        caption: @text_value
      }
    }
    verify_ui_states(ui)

  end

  def set_switch_state(state)
    toggle_switch.wait_until_visible(5)
    toggle_switch.set_switch_state(state.downcase.to_sym == :on)
  end

  def verify_switch_state(state)
    status = state.downcase.to_sym == :on
    state_message = status ? 'OFF' : 'ON'
    ui = {
      toggle_switch => {
        visible: true,
        enabled: true,
        checked: status
      },
      switch_state => {
        visible: true,
        caption: "Click to turn the switch #{state_message}"
      }
    }
    verify_ui_states(ui)
  end

  def active_button_tap
    active_button.wait_until_visible(5)
    active_button.click
  end

  def invoke_drop_menu
    drop_down_field.wait_until_visible(5)
    drop_down_field.click
  end

  def verify_menu_selection
    ui = {
      drop_down_field => {
        visible: true,
        value: { translate: 'wdio.form_screen.drop_selection' }
      },
      drop_down_menu => { visible: false }
    }
    verify_ui_states(ui)
  end
end
