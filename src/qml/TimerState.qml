import QtQuick 2.11

Item {
  property bool is_running: false

  property int start: 0
  property int end: 100
  property int current: 0

  property var time_text: "02:00"

  QtObject {
    id: m

    property string start_time: null
    property string set_time: null
  }

  function start_stop(start_time) {
    is_running = ! is_running;

    if(is_running) {
      var set_time = time_text.split(':');
      m.set_time = (60 * parseInt(set_time[0]) + parseInt(set_time[1])) * 1000;
      m.start_time = start_time;
    }
  }

  function update(current_time) {
    time_text = Qt.formatTime(new Date(m.set_time - (current_time - m.start_time)), "mm:ss");
  }

}
