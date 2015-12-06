library free_poll.my_name_component;

import 'package:angular2/angular2.dart';

@Component(selector: 'my-name')
@View(template: '''
        <p>My name: {{ myName }}</p>
      ''')
class MyNameComponent {
  String myName = 'Burak';
}
