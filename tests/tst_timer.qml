import QtQuick 2.11
import QtTest 1.11

import "qrc:/Timer/Controller.js" as Controller

TestCase {
  id: test_case

  name: "DummyTest"

  function create_testee() {
      var component = Qt.createComponent("qrc:/Timer/TimerState.qml");
      return createTemporaryObject(component, {})
  }

  function test_on_startup_the_timer_is_not_running() {
      var testee = create_testee();

      verify(! testee.is_running);
  }

  function test_start_stop_toggles_timer_between_running_and_stopped() {
      var testee = create_testee();

      Controller.start_stop(testee);
      verify(testee.is_running);

      Controller.start_stop(testee);
      verify(! testee.is_running);
  }

  function testee_when_stop_is_pressed

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
}
