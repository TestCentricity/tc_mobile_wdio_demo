class CarouselItem < TestCentricity::ScreenSection
  include SharedCarouselItem

  trait(:section_name)    { 'Carousel Item' }
  trait(:section_locator) { { xpath: '(//XCUIElementTypeOther[contains(@name, "__CAROUSEL_ITEM_")])' } }

  # Carousel Item UI elements
  labels card_title:  { xpath: '//XCUIElementTypeOther[@name="slideTextContainer"]/XCUIElementTypeStaticText[1]' },
         card_detail: { xpath: '//XCUIElementTypeOther[@name="slideTextContainer"]/XCUIElementTypeStaticText[2]' }
end
