import QtQuick 2.11
import QtTest 1.11

TestCase {
  name: "Timer Test"

  function create_testee() {
    var component = Qt.createComponent("qrc:/Timer/TimerState.qml");
    return createTemporaryObject(component, {});
  }

  function test_on_startup_the_timer_is_not_running() {
    var testee = create_testee();

    verify(! testee.is_running);
  }

  function test_start_stop_toggles_timer_between_running_and_stopped() {
    var testee = create_testee();

    testee.start_stop("", new Date().getTime());
    verify(testee.is_running);

    testee.start_stop("", null);
    verify(! testee.is_running);
  }

  function test_when_started_the_time_is_the_set_time() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("17:21", start_time);
    compare(testee.time_text, "17:21");
  }


  function test_when_started_the_time_is_counting_down() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("07:30", start_time);
    testee.update(start_time + 42 * 1000);

    compare(testee.time_text, "06:48");
  }

  function test_timer_counts_down_after_whole_second_passed() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("12:35", start_time);

    testee.update(start_time + 999);
    compare(testee.time_text, "12:35");

    testee.update(start_time + 1000);
    compare(testee.time_text, "12:34");
  }

  function test_timer_minutes_can_go_up_to_99_minutes_and_59_seconds() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("99:59", start_time);
    compare(testee.time_text, "99:59");

    testee.update(start_time)
    compare(testee.time_text, "99:59");
  }

  function test_progress_is_relative_to_remaining_time() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("00:25", start_time);
    testee.update(start_time + 5 * 1000);

    var progress = (testee.current - testee.start) / (testee.end - testee.start);
    fuzzyCompare(progress, 0.2, 0.001);
  }

  function test_after_stoping_time_is_reset_to_original_value() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("01:11", start_time);
    testee.update(start_time + 25 * 1000);

    testee.start_stop(null);

    compare(testee.time_text, "01:11");
  }

  function test_after_stoping_progress_is_reset_to_zero() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("01:11", start_time);
    testee.update(start_time + 25 * 1000);

    testee.start_stop(null);

    compare(testee.current, 0);
  }

  function test_timer_does_not_underflow() {
    var testee = create_testee();
    var start_time = new Date().getTime();

    testee.start_stop("01:23", start_time);
    testee.update(start_time + 123 * 1000);

    compare(testee.time_text, "00:00");
  }

  function test_convert_string_to_minutes_and_seconds() {
    var testee = create_testee();

    compare(testee.to_min_sec("00:00"), {min: 0, sec: 0});
    compare(testee.to_min_sec("01:02"), {min: 1, sec: 2});
    compare(testee.to_min_sec("99:59"), {min: 99, sec: 59});
  }

  function test_convert_minutes_and_seconds_to_string() {
    var testee = create_testee();

    compare(testee.to_text(0, 0), "00:00");
    compare(testee.to_text(5, 7), "05:07");
    compare(testee.to_text(12, 34), "12:34");
  }
}
