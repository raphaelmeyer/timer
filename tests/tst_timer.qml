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

    testee.start_stop(new Date().getTime());
    verify(testee.is_running);

    testee.start_stop(null);
    verify(! testee.is_running);
  }

  function test_when_started_the_time_is_counting_down() {
    var testee = create_testee();
    testee.time_text = "07:30";

    var start_time = new Date().getTime();

    testee.start_stop(start_time);
    testee.update(start_time + 42 * 1000);

    compare(testee.time_text, "06:48");
  }

  function test_timer_minutes_can_go_up_to_99_minutes_and_59_seconds() {
    var testee = create_testee();
    testee.time_text = "99:59";

    compare(testee.time_text, "99:59");

    var start_time = new Date().getTime();
    testee.start_stop(start_time);
    compare(testee.time_text, "99:59");

    testee.update(start_time)
    compare(testee.time_text, "99:59");
  }

  // given  input 02:30
  // when   click start
  // then   timer starts running from "02:30"

  // given  timer running with 02:00
  // when   timer ran for 01:23
  // then   timer shows 00:37 left

  // given  timer running with 02:00
  // when   timer ran for 02:00
  // then   timer restarts from 02:00

  // given  timer not running
  // then   input is editable
  // and    button is start

  // given  timer is running
  // then   input is not editable
  // and    button is stop

  // given  timer running with 02:00
  // when   click stop
  // then   timer is not running
  // and    input is reset to 02:00


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
