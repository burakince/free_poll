library free_poll.time_component;

import 'package:angular2/angular2.dart';
import 'dart:async';

@Component(selector: 'my-time')
@View(template: '''
        <p>Current time: {{ time }}</p>
      ''')
class TimeComponent {
  String time;
  Timer _timer;

  TimeComponent() {
    _updateTime(null);
    _timer = new Timer.periodic(new Duration(seconds: 1), _updateTime);
  }

  _updateTime(Timer _) {
    time = new DateTime.now().toString();
  }

}
