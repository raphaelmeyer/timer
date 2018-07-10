import QtQuick 2.11
import QtQuick.Controls 2.4
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

  color: "lightsteelblue"

  minimumWidth: 200
  minimumHeight: 200

  onFullscreenChanged: visibility = (fullscreen ?  Window.FullScreen : Window.Windowed);

  TimerState {
    id: m
  }

  ArcProgress {
    id: progress

    anchors.fill: parent

    color: "midnightblue"

    from: m.start
    to: m.end
    progress: m.current
  }

  Rectangle {
    anchors.fill: parent
    color: "transparent"

    TextInput {
      id: time_input

      anchors.centerIn: parent

      font.pixelSize: Math.max(24, Math.min(parent.width, parent.height) / 8)
      font.bold: true
      color: "midnightblue"

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
        m.start_stop(time_input.text, new Date().getTime())

        start_stop.text = m.is_running ? "Stop" : "Start"
        time_input.readOnly = m.is_running
      }
    }
  }

  Timer {
    id: timer
    interval: 100
    running: m.is_running
    repeat: true
    onTriggered: {
      m.update(new Date().getTime())
      time_input.text = m.time_text
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
