import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Window 2.11

ApplicationWindow
{
  id: window

  property bool fullscreen: false

  title: qsTr("Timer")
  visible: true
  flags: Qt.FramelessWindowHint
  minimumWidth: 200
  minimumHeight: 200

  onFullscreenChanged: visibility = (fullscreen ?  Window.FullScreen : Window.Windowed);

  ArcProgress {
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
