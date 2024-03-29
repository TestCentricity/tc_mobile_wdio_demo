module WorldScreens

  #
  # The screen_objects method returns a hash table of your native mobile app's screen objects and associated screen
  # classes to be instantiated by the TestCentricity ScreenManager.
  #
  # iOS Screen Object class definitions are contained in the features/support/ios/screens folder.
  # Android Screen Object class definitions are contained in the features/support/android/screens folder.
  #
  def screen_objects
    {
      base_app_screen:  BaseWDIODemoAppScreen,
      form_screen:      FormScreen,
      swipe_screen:     SwipeScreen,
      drag_drop_screen: DragDropScreen
    }
  end
end


World(WorldScreens)
