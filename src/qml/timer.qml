import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11

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

  RowLayout {
    id: time_input

    spacing: 2

    TextInput {
      id: hours
      inputMask: "99"
      text: "00"
      font.pixelSize: 24
    }

    Text { text: ":"; font.pixelSize: 24 }

    TextInput {
      id: minutes
      inputMask: "99"
      font.pixelSize: 24
    }

    Text { text: ":"; font.pixelSize: 24 }

    TextInput {
      id: seconds
      inputMask: "99"
      font.pixelSize: 24
    }
  }

  Button {
    id: start
    text: "Start"
    onClicked: timer.running = true
  }

  Timer {
    id: timer
    interval: 100
    running: false
    repeat: true
    onTriggered: time.text = Date().toString()
  }

  Text {
    id: time
  }

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
