import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Window 2.11

ApplicationWindow
{
  id: window

  title: qsTr("Timer")

  visible: true
  flags: Qt.FramelessWindowHint

  minimumWidth: 200
  minimumHeight: 200

  property bool fullscreen: false
  onFullscreenChanged: visibility = (fullscreen ?  Window.FullScreen : Window.Windowed)

  Action {
    id: fullscreenAction
    enabled: true
    shortcut: "Ctrl+F"
    onTriggered: fullscreen = !fullscreen
  }
}
