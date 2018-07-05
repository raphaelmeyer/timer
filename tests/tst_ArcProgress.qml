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

  function test_circle_start_point_is_slightly_off_clockwise_from_top_of_window_center() {
    var start = 0

    var x = ArcProgress.start_x(480, 320, start)
    var y = ArcProgress.start_y(480, 320, start)

    verify(x > 240)
    verify(y > 160 - 128)

    fuzzyCompare(x, 240, 2.0)
    fuzzyCompare(y, 160 - 128, 2.0)

    var x = ArcProgress.start_x(320, 480, start)
    var y = ArcProgress.start_y(320, 480, start)

    verify(x > 160)
    verify(y > 240 - 128)

    fuzzyCompare(x, 160, 2.0)
    fuzzyCompare(y, 240 - 128, 2.0)
  }

  function test_circle_start_point_moves_clockwise_with_increasing_progress() {
    var delta = 0.1

    fuzzyCompare(ArcProgress.start_x(480, 320, 0.25), 240 + 128, delta)
    fuzzyCompare(ArcProgress.start_y(480, 320, 0.25), 160, delta)

    fuzzyCompare(ArcProgress.start_x(480, 320, 0.5), 240, delta)
    fuzzyCompare(ArcProgress.start_y(480, 320, 0.5), 160 + 128, delta)

    fuzzyCompare(ArcProgress.start_x(480, 320, 0.75), 240 - 128, delta)
    fuzzyCompare(ArcProgress.start_y(480, 320, 0.75), 160, delta)
  }


  // todo straight on top of center
  function test_circle_end_point_on_top_of_window_center() {
    compare(ArcProgress.end_x(480, 320), 240)
    compare(ArcProgress.end_y(480, 320), 160 - 128)

    compare(ArcProgress.end_x(320, 480), 160)
    compare(ArcProgress.end_y(320, 480), 240 - 128)
  }



}
