import QtQuick 2.11
import QtTest 1.11

import "qrc:/Timer/"

TestCase {
  name: "DummyTest"

  ArcProgress {
    id: testee
  }

  // given  input 02:30
  // when   click start
  // then   timer starts running from "02:30"
  function test_start_timer() {
    //testee.set_min = "02"
    //testee.set_sec = "30"

    //click_start()

    //compare(testee.remaining, 150)
    //compare(testee.is_running, true)
  }

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



  function test_dummy() {
    compare(testee.from, 0)
    compare(testee.to, 100)
    compare(testee.progress, 0)
  }
}