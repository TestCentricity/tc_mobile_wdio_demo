class SwipeScreen < BaseWDIODemoAppScreen
  include SharedSwipeScreen

  trait(:screen_name)    { 'Swipe' }
  trait(:screen_locator) { { accessibility_id: 'Swipe-screen' } }
  trait(:navigator)      { go_to_swipe }

  # Swipe screen UI elements
  labels  header_label:   { predicate: 'name == "Swipe horizontal"' },
          swipe_message:  { accessibility_id: "Or swipe vertical to find what I'm hiding." },
          found_message:  { predicate: 'name == "You found me!!!"' }
  list    :carousel_list, { accessibility_id: 'Carousel' }
  image   :logo_image,    { predicate: 'type == "XCUIElementTypeImage"' }
  section :carousel_item, CarouselItem

  def initialize
    super
    # define the list item element for the Carousel list object
    list_elements = {
      list_item: { xpath: '//XCUIElementTypeOther[contains(@name, "__CAROUSEL_ITEM_")]' },
      scrolling: :horizontal
    }
    carousel_list.define_list_elements(list_elements)
    # associate the Carousel Item indexed section object with the Carousel list object
    carousel_item.set_list_index(carousel_list)
  end
end
