import QtQuick 2.11
import QtTest 1.11

import "qrc:/Timer/ArcProgress.js" as ArcProgress

TestCase {
  name: "ArcProgressTest"

  function test_dummy() {
    compare(ArcProgress.foo(), 23)
  }

}