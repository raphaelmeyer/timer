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

  function test_when_the_window_is_wider_than_high_then_the_radius_is_40_percent_of_the_height() {
    compare(ArcProgress.radius(200, 100), 40)
    compare(ArcProgress.radius(123, 25), 10)
  }

  function test_when_the_window_is_higher_than_wide_then_the_radius_is_40_percent_of_the_width() {
    compare(ArcProgress.radius(35, 77), 14)
  }

  function test_right_semi_circle_is_drawn_from_top_of_center_to_bottom_of_center() {
    var progress = 0

    compare(ArcProgress.right_start_x(480, 320, progress), 240)
    compare(ArcProgress.right_start_y(480, 320, progress), 160 - 128)

    compare(ArcProgress.right_end_x(480, 320, progress), 240)
    compare(ArcProgress.right_end_y(480, 320, progress), 160 + 128)


    compare(ArcProgress.right_start_x(320, 480, progress), 160)
    compare(ArcProgress.right_start_y(320, 480, progress), 240 - 128)

    compare(ArcProgress.right_end_x(320, 480, progress), 160)
    compare(ArcProgress.right_end_y(320, 480, progress), 240 + 128)
  }

  function test_when_progress_is_smaller_than_50_precent_then_the_right_semi_circle_is_decreased_from_start_towards_end() {
    var progress = 0.25;

    compare(ArcProgress.right_start_x(480, 320, progress), 240 + 128)
    compare(ArcProgress.right_start_y(480, 320, progress), 160)
  }

  function test_when_progress_is_bigger_than_50_precent_then_the_right_semi_circle_is_empty() {
    var progress = 0.501;

    compare(ArcProgress.right_start_x(480, 320, progress), 0)
    compare(ArcProgress.right_start_y(480, 320, progress), 0)
  }

  function test_left_semi_circle_is_drawn_from_bottom_of_center_to_top_of_center() {

  }

  function test_when_progress_is_smaller_than_50_precent_then_the_left_semi_circle_is_full() {

  }

  function test_when_progress_is_bigger_than_50_precent_then_the_left_semi_circle_is_decreased_from_start_towards_end() {

  }
}
