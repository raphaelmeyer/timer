import QtQuick 2.11

Item {
  property bool is_running: false

  property int start: 0
  property int end: 100
  property int current: 0

  property var time_text: ""

  QtObject {
    id: m

    property var start_time: new Number()
    property var set_millisec: new Number()
    property var set_time: ""
  }

  function start_stop(set_time, start_time) {
    is_running = ! is_running;

    if(is_running) {
      var t = to_min_sec(set_time);
      m.set_millisec = 1000 * (60 * t.min + t.sec);
      m.set_time = set_time;
      m.start_time = Number.parseInt(start_time);

      start = 0;
      current = 0;
      end = m.set_millisec;
    } else {
      current = 0;
    }
    time_text = m.set_time;
  }

  function update(current_time) {
    var passed = Number.parseInt(current_time) - m.start_time;

    var remaining = Math.ceil((m.set_millisec - passed) / 1000);
    remaining = Math.max(0, remaining);

    var min = Math.floor(remaining / 60);
    var sec = remaining % 60;

    time_text = to_text(min, sec);
    current = passed;
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
