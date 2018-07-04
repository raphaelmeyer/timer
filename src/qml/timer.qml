import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11

import "./Timer"

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
    id: progress

    anchors.fill: parent
  }

  Rectangle {
    anchors.fill: parent
    color: "transparent"

    TextInput {
      id: time_input

      anchors.centerIn: parent

      text: "02:00"

      inputMask: "99:99;0"
      validator: RegExpValidator { regExp: /^[0-9][0-9]:[0-5][0-9]$/ }
    }

    Button {
      id: start_stop

      anchors.bottom: parent.bottom
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottomMargin: 20

      text: "Start"

      onClicked: {
        timer.running = true
      }
    }
  }

  Timer {
    id: timer
    interval: 100
    running: false
    repeat: true
    onTriggered: {
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
