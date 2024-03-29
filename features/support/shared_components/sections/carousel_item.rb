module SharedCarouselItem
  def get_value
    card_title.scroll_into_view(scroll_mode = :horizontal)
    "#{card_title.get_caption}\n#{card_detail.get_caption}"
  end
end
