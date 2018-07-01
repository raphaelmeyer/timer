import QtQuick 2.11
import QtQuick.Shapes 1.11

Item {

  property double from: 0
  property double to: 100
  property double progress: 0

  Shape {
    anchors.fill: parent

    ShapePath {
      fillColor: "transparent"
      strokeColor: "blue"
      strokeWidth: 8

      startX: 200; startY: 100
      PathArc {
        x: 200; y: 300
        radiusX: 100; radiusY: 100
      }
    }
  }

  Shape {
    anchors.fill: parent

    ShapePath {
      fillColor: "transparent"
      strokeColor: "green"
      strokeWidth: 8

      startX: 200; startY: 300
      PathArc {
        x: 200; y: 100
        radiusX: 100; radiusY: 100
      }
    }
  }

}
