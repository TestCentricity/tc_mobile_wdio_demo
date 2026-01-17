# Card data sourcing object
class CardDataSource < TestCentricity::DataSource
  def find_card(card_id)
    CardData.current = CardData.new(environs.read('Carousel_data', card_id))
  end
end


# Card data presenter object
class CardData < TestCentricity::DataPresenter
  attribute :id, Integer
  attribute :card_title, String
  attribute :card_detail, String
end
