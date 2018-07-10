import QtQuick 2.11

Item {
  property bool is_running: false

  property int start: 0
  property int end: 100
  property int current: 0

  property var time_text: "02:00"

  QtObject {
    id: m

    property var start_time: new Number()
    property var set_time: new Number()
  }

  function start_stop(start_time) {
    is_running = ! is_running;

    if(is_running) {
      var t = to_min_sec(time_text);
      m.set_time = 1000 * (60 * t.min + t.sec);

      m.start_time = Number.parseInt(start_time);
    }
  }

  function update(current_time) {
    var remaining = (m.start_time + m.set_time - Number.parseInt(current_time)) / 1000;
    var min = Math.floor(remaining / 60);
    var sec = remaining % 60;
    time_text = to_text(min, sec);
  }

  function to_min_sec(text) {
    var time = text.split(":");
    var min = Number.parseInt(time[0]);
    var sec = Number.parseInt(time[1]);

    return {min: min, sec: sec};
  }

  function to_text(min, sec) {
    return ("0" + min).slice(-2) + ":" + ("0" + sec).slice(-2);
  }
}
