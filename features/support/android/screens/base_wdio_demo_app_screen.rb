class BaseWDIODemoAppScreen < TestCentricity::ScreenObject
  include SharedBaseWDIODemoAppScreen

  trait(:screen_name)    { 'Base WDIO Demo App Screen' }
  trait(:screen_locator) { { id: 'com.wdiodemoapp:id/action_bar_root' } }

  # Base App screen UI elements
  buttons home_button:    { accessibility_id: 'Home' },
          webview_button: { accessibility_id: 'Webview' },
          login_button:   { accessibility_id: 'Login' },
          forms_button:   { accessibility_id: 'Forms' },
          swipe_button:   { accessibility_id: 'Swipe' },
          drag_button:    { accessibility_id: 'Drag' }
  alert   :alert_modal,   { id: 'android:id/parentPanel' }
end
