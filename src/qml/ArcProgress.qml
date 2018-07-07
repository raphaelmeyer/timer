import QtQuick 2.11
import QtQuick.Shapes 1.11

import "ArcProgress.js" as Util

Item {

  property color color: "black"

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
      id: arc

      fillColor: "transparent"
      strokeColor: color
      strokeWidth: Math.min(parent.width, parent.height) / 25
      capStyle: ShapePath.FlatCap

      startX: Util.start_x(parent.width, parent.height, m.normalized)
      startY: Util.start_y(parent.width, parent.height, m.normalized)

      PathArc {
        direction: PathArc.Clockwise
        useLargeArc: m.normalized < 0.5

        x: Util.end_x(parent.width, parent.height, m.normalized)
        y: Util.end_y(parent.width, parent.height, m.normalized)

        radiusX: m.radius
        radiusY: m.radius
      }
    }
  }

}
