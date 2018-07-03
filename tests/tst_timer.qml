import QtQuick 2.11
import QtTest 1.11

import "qrc:/Timer/"

TestCase {
  name: "DummyTest"

  ArcProgress {
    id: testee
  }

  function test_math() {
    compare(testee.from, 0)
    compare(testee.to, 100)
    compare(testee.progress, 0)
  }
}