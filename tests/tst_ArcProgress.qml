import QtQuick 2.11
import QtTest 1.11

import "qrc:/Timer/ArcProgress.js" as ArcProgress

TestCase {
  name: "ArcProgress Calculations"

  function test_progress_is_normalized_between_0_and_1() {
    compare(ArcProgress.progress(0, 100, 50), 0.5)
    compare(ArcProgress.progress(0, 100, 23), 0.23)
    compare(ArcProgress.progress(7, 27, 11), 0.2)
  }

  function test_progress_could_range_from_high_to_low() {
    compare(ArcProgress.progress(100, 0, 42), 0.58)
    compare(ArcProgress.progress(23, 3, 8), 0.75)
  }

  function test_progress_out_of_range_is_trimmed() {
    compare(ArcProgress.progress(23, 67, 11), 0)
    compare(ArcProgress.progress(67, 23, 78), 0)

    compare(ArcProgress.progress(27, 55, 98), 1)
    compare(ArcProgress.progress(55, 27, 13), 1)
  }

  function test_right_semi_circle_end_postion_is_at_bottom_center() {
    width = 100
    height = 100
    compare(ArcProgress.right_end_x(width, height), 50)
    compare(ArcProgress.right_end_y(width, height), 100)
  }

  function test_right_semi_circle_positions_are_zero_when_progress_is_more_than_half() {
    fail()
  }

  function test_right_semi_circle_start_position_is______() {
    fail()
  }
}
