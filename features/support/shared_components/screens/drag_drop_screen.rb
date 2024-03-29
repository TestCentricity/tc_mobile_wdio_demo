module SharedDragDropScreen
  attr_accessor :start_drag_x
  attr_accessor :start_drag_y

  def verify_screen_ui
    ui = {
      header_label => {
        visible: true,
        caption: 'Drag and Drop'
      },
      renew_button => {
        visible: true,
        enabled: true
      },
      retry_button => { visible: false },
      left_row_1_drop => { visible: true },
      left_row_2_drop => { visible: true },
      left_row_3_drop => { visible: true },
      center_row_1_drop => { visible: true },
      center_row_2_drop => { visible: true },
      center_row_3_drop => { visible: true },
      right_row_1_drop => { visible: true },
      right_row_2_drop => { visible: true },
      right_row_3_drop => { visible: true },
      left_row_1_drag => { visible: true },
      left_row_2_drag => { visible: true },
      left_row_3_drag => { visible: true },
      center_row_1_drag => { visible: true },
      center_row_2_drag => { visible: true },
      center_row_3_drag => { visible: true },
      right_row_1_drag => { visible: true },
      right_row_2_drag => { visible: true },
      right_row_3_drag => { visible: true }
    }
    verify_ui_states(ui)
  end

  def drag_to_empty_space
    center_row_2_drag.wait_until_visible(5)
    @start_drag_x = center_row_2_drag.x_loc
    @start_drag_y = center_row_2_drag.y_loc
    center_row_2_drag.drag_by(100, -350)
  end

  def drag_to_wrong_slot
    center_row_2_drag.wait_until_visible(5)
    @start_drag_x = center_row_2_drag.x_loc
    @start_drag_y = center_row_2_drag.y_loc
    center_row_2_drag.drag_and_drop(left_row_1_drop)
  end

  def verify_drag_blocked
    sleep(1)
    ui = {
      center_row_2_drag => {
        visible: true,
        x: @start_drag_x,
        y: @start_drag_y,
      }
    }
    verify_ui_states(ui)
  end

  def drag_to_correct_slot
    center_row_2_drag.wait_until_visible(5)
    center_row_2_drag.drag_and_drop(center_row_2_drop)
  end

  def verify_drag_success
    ui = {
      center_row_2_drag => { visible: false },
      center_row_2_drop => { visible: false }
    }
    verify_ui_states(ui)
  end

  def solve_puzzle
    renew
    left_row_1_drag.drag_and_drop(left_row_1_drop)
    left_row_2_drag.drag_and_drop(left_row_2_drop)
    left_row_3_drag.drag_and_drop(left_row_3_drop)
    center_row_1_drag.drag_and_drop(center_row_1_drop)
    center_row_2_drag.drag_and_drop(center_row_2_drop)
    center_row_3_drag.drag_and_drop(center_row_3_drop)
    right_row_1_drag.drag_and_drop(right_row_1_drop)
    right_row_2_drag.drag_and_drop(right_row_2_drop)
    right_row_3_drag.drag_and_drop(right_row_3_drop)
  end

  def verify_puzzle_solved
    retry_button.wait_until_visible(5)
    ui = {
      retry_message => {
        visible: true,
        caption: 'You made it, click retry if you want to try it again.'
      },
      retry_button => {
        visible: true,
        enabled: true,
        caption: 'Retry'
      },
      left_row_1_drop => { visible: false },
      left_row_2_drop => { visible: false },
      left_row_3_drop => { visible: false },
      center_row_1_drop => { visible: false },
      center_row_2_drop => { visible: false },
      center_row_3_drop => { visible: false },
      right_row_1_drop => { visible: false },
      right_row_2_drop => { visible: false },
      right_row_3_drop => { visible: false },
      left_row_1_drag => { visible: false },
      left_row_2_drag => { visible: false },
      left_row_3_drag => { visible: false },
      center_row_1_drag => { visible: false },
      center_row_2_drag => { visible: false },
      center_row_3_drag => { visible: false },
      right_row_1_drag => { visible: false },
      right_row_2_drag => { visible: false },
      right_row_3_drag => { visible: false }
    }
    verify_ui_states(ui)
  end

  def retry
    retry_button.click
    retry_button.wait_until_hidden(5)
  end

  def renew
    renew_button.wait_until_visible(5)
    renew_button.click
  end
end
