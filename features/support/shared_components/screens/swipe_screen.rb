module SharedSwipeScreen
  def verify_screen_ui
    cards = []
    (1..6).each do |item|
      card_data_source.find_card(item.to_s)
      cards.push("#{CardData.current.card_title}\n#{CardData.current.card_detail}")
    end

    ui = {
      header_label => {
        visible: true,
        caption: 'Swipe horizontal'
      },
      logo_image => { visible: false },
      carousel_list => {
        visible: true,
        itemcount: 6
      },
      carousel_item => { items: cards }
    }
    verify_ui_states(ui)
  end

  def swipe_vertical(direction)
    swipe_obj = case direction
                when :down
                  swipe_message
                when :up
                  logo_image
                end
    swipe_obj.wait_until_visible(5)
    swipe_obj.swipe_gesture(direction, distance = 1)
  end

  def verify_image_visibility(visibility)
    sleep(1)
    ui = {
      logo_image => { visible: visibility },
      header_label => { hidden: visibility },
    }
    verify_ui_states(ui)
  end

  def swipe_horizontal(direction)
    carousel_list.swipe_gesture(direction)
  end
end
