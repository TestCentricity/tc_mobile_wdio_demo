class DragDropScreen < BaseWDIODemoAppScreen
  include SharedDragDropScreen

  trait(:screen_name)    { 'Drag and Drop' }
  trait(:screen_locator) { { accessibility_id: 'Drag-drop-screen' } }
  trait(:navigator)      { go_to_drag }

  # Drag and Drop screen UI elements
  labels   header_label:      { predicate: 'name == "Drag and Drop"' },
           retry_message:     { accessibility_id: 'You made it, click retry if you want to try it again.' }
  elements left_row_1_drop:   { accessibility_id: 'drop-l1' },
           left_row_2_drop:   { accessibility_id: 'drop-l2' },
           left_row_3_drop:   { accessibility_id: 'drop-l3' },
           center_row_1_drop: { accessibility_id: 'drop-c1' },
           center_row_2_drop: { accessibility_id: 'drop-c2' },
           center_row_3_drop: { accessibility_id: 'drop-c3' },
           right_row_1_drop:  { accessibility_id: 'drop-r1' },
           right_row_2_drop:  { accessibility_id: 'drop-r2' },
           right_row_3_drop:  { accessibility_id: 'drop-r3' }
  buttons  renew_button:      { accessibility_id: 'renew' },
           retry_button:      { accessibility_id: 'button-Retry' }
  images   left_row_1_drag:   { accessibility_id: 'drag-l1' },
           left_row_2_drag:   { accessibility_id: 'drag-l2' },
           left_row_3_drag:   { accessibility_id: 'drag-l3' },
           center_row_1_drag: { accessibility_id: 'drag-c1' },
           center_row_2_drag: { accessibility_id: 'drag-c2' },
           center_row_3_drag: { accessibility_id: 'drag-c3' },
           right_row_1_drag:  { accessibility_id: 'drag-r1' },
           right_row_2_drag:  { accessibility_id: 'drag-r2' },
           right_row_3_drag:  { accessibility_id: 'drag-r3' }
end
