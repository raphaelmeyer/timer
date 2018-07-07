import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11

import "./Timer"
import "./Timer/Controller.js" as Controller

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

  QtObject {
    id: m

    property bool is_running: false
    property var start_time: new Date().getTime()
    property var set_time: "02:00"
  }

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

      font.pixelSize: Math.max(24, Math.min(parent.width, parent.height) / 8)
      font.bold: true
      color: "green"

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
        Controller.start_stop(m)

        start_stop.text = m.is_running ? "Stop" : "Start"
        time_input.readOnly = m.is_running

        timer.running = m.is_running
      }
    }
  }

  Timer {
    id: timer
    interval: 100
    running: false
    repeat: true
    onTriggered: {
      if(m.is_running) {
        time_input.text = Controller.text(m)
        progress.progress = Controller.progress(m)
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
