library free_poll.static_list_component;

import 'package:angular2/angular2.dart';

@Component(selector: 'my-list')
@View(template: '''
        <p>Friends:</p>
        <ul>
          <li *ng-for="#name of friendNames">
            {{ name }}
          </li>
        </ul>
      ''', directives: const [NgFor])
class StaticListComponent {

  List<String> friendNames = const [
    'Aarav',
    'Martín',
    'Shannon',
    'Ariana',
    'Kai'
  ];

}