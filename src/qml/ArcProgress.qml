import QtQuick 2.11
import QtQuick.Shapes 1.11

import "ArcProgress.js" as Util

Item {

  property double from: 0
  property double to: 100
  property double progress: 0

  Shape {

    ShapePath {
      id: right_arc

      fillColor: "transparent"
      strokeColor: "blue"
      strokeWidth: 8

      startX: parent.width / 2
      startY: 100

      PathArc {
        x: parent.width / 2
        y: parent.height - 100

        radiusX: parent.width / 2 - 200
        radiusY: parent.height / 2 - 200
      }
    }

    ShapePath {
      id: left_arc

      fillColor: "transparent"
      strokeColor: "green"
      strokeWidth: 8

      startX: 100
      startY: 200

      PathArc {
        x: Util.progress(from, to, progress)
        y: 0

        radiusX: 100
        radiusY: 100
      }
    }
  }

}
