class CarouselItem < TestCentricity::ScreenSection
  include SharedCarouselItem

  trait(:section_name)    { 'Carousel Item' }
  trait(:section_locator) { { xpath: '(//android.view.ViewGroup[contains(@resource-id, "__CAROUSEL_ITEM_")])' } }

  # Carousel Item UI elements
  labels card_title:  { xpath: '//android.view.ViewGroup[@content-desc="card"]/android.view.ViewGroup[@content-desc="slideTextContainer"]/android.widget.TextView[1]' },
         card_detail: { xpath: '//android.view.ViewGroup[@content-desc="card"]/android.view.ViewGroup[@content-desc="slideTextContainer"]/android.widget.TextView[2]' }
end
