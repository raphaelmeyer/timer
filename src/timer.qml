import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Window 2.11
import QtQuick.Shapes 1.11

ApplicationWindow
{
  id: window

  title: qsTr("Timer")

  visible: true
  flags: Qt.FramelessWindowHint

  minimumWidth: 200
  minimumHeight: 200

  property bool fullscreen: false
  onFullscreenChanged: visibility = (fullscreen ?  Window.FullScreen : Window.Windowed);

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

  Action {
    id: fullscreenAction
    enabled: true
    shortcut: "Ctrl+F"
    onTriggered: fullscreen = !fullscreen;
  }

  Action {
    id: quitAction
    enabled: true
    shortcut: "Ctrl+Q"
    onTriggered: Qt.quit();
  }
}
