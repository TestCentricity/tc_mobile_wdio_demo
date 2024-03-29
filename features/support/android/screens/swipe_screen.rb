class SwipeScreen < BaseWDIODemoAppScreen
  include SharedSwipeScreen

  trait(:screen_name)    { 'Swipe' }
  trait(:screen_locator) { { accessibility_id: 'Swipe-screen' } }
  trait(:navigator)      { go_to_swipe }

  # Swipe screen UI elements
  labels  header_label:   { xpath: '//android.widget.ScrollView[@content-desc="Swipe-screen"]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView' },
          swipe_message:  { xpath: '//android.widget.ScrollView[@content-desc="Swipe-screen"]/android.view.ViewGroup/android.widget.TextView[1]' },
          found_message:  { xpath: '//android.widget.ScrollView[@content-desc="Swipe-screen"]/android.view.ViewGroup/android.widget.TextView[2]' }
  list    :carousel_list, { accessibility_id: 'Carousel' }
  image   :logo_image,    { accessibility_id: 'WebdriverIO logo' }
  section :carousel_item, CarouselItem

  def initialize
    super
    # define the list item element for the Carousel list object
    list_elements = {
      list_item: { xpath: '//android.view.ViewGroup[contains(@resource-id, "__CAROUSEL_ITEM_")]' },
      scrolling: :horizontal
    }
    carousel_list.define_list_elements(list_elements)
    # associate the Carousel Item indexed section object with the Carousel list object
    carousel_item.set_list_index(carousel_list)
  end
end
