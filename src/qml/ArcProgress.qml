import QtQuick 2.11
import QtQuick.Shapes 1.11

import "ArcProgress.js" as Util

Item {

  property double from: 0
  property double to: 100
  property double progress: 0

  QtObject {
    id: m

    property double normalized : Util.progress(from, to, progress)
    property double radius: Util.radius(parent.width, parent.height)
  }

  Shape {

    ShapePath {
      id: right_arc

      fillColor: "transparent"
      strokeColor: m.normalized < 0.5 ? "blue" : "transparent"
      strokeWidth: 16

      startX: Util.right_start_x(parent.width, parent.height, m.normalized)
      startY: Util.right_start_y(parent.width, parent.height, m.normalized)

      PathArc {
        x: Util.right_end_x(parent.width, parent.height, m.normalized)
        y: Util.right_end_y(parent.width, parent.height, m.normalized)

        radiusX: m.radius
        radiusY: m.radius
      }
    }

    ShapePath {
      id: left_arc

      fillColor: "transparent"
      strokeColor: "green"
      strokeWidth: 16

      startX: parent.width / 2
      startY: Util.right_end_y(parent.width, parent.height, 0)

      PathArc {
        x: parent.width / 2
        y: Util.right_start_y(parent.width, parent.height, 0)

        radiusX: m.radius
        radiusY: m.radius
      }
    }
  }

}
