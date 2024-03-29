module SharedBaseWDIODemoAppScreen
  include WorldData
  include WorldScreens

  def load_screen
    navigator
  end

  def navigate_to
    navigator
  end

  def go_home
    home_button.click
  end

  def go_to_webview
    webview_button.click
  end

  def go_to_login
    login_button.click
  end

  def go_to_forms
    forms_button.click
  end

  def go_to_swipe
    swipe_button.click
  end

  def go_to_drag
    drag_button.click
  end

  def modal_action(action)
    alert_modal.await_and_respond(action, timeout = 1)
  end

  def verify_modal_state(visible)
    ui = if visible
           button_captions = ['Ask me later', 'Cancel', 'OK']
           button_captions = button_captions.map(&:upcase) if Environ.is_android?
           {
             alert_modal => {
               visible: true,
               caption: ['This button is', 'This button is active'],
               buttons: button_captions
             }
           }
         else
           { alert_modal => { visible: false } }
         end
    verify_ui_states(ui)
  end
end
