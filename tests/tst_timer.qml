import QtQuick 2.11
import QtTest 1.11

// TODO
//   copy qml resources to build dir or fiugre
//   out how to access compiled qt quick resources
import "../../src/qml"

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