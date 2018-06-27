import QtQuick 2.11
import QtQuick.Shapes 1.11

Shape {
  anchors.fill: parent

  ShapePath {
    fillColor: "transparent"
    strokeColor: "blue"
    strokeWidth: 8

    startX: 200; startY: 200
    PathArc {
      x: 100; y: 100
      radiusX: 50; radiusY: 50
    }
  }
}



