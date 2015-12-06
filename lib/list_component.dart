library free_poll.list_component;

import 'package:angular2/angular2.dart';
import 'package:free_poll/friends_service.dart';

@Component(selector: 'my-list', viewProviders: const [FriendsService])
@View(
    template: '''
        <p>Friends:</p>
        <ul>
          <li *ng-for="#name of friendNames">
            {{ name }}
          </li>
        </ul>
        <p *ng-if="friendNames.length > 3">You have many friends!</p>
      ''',
    directives: const [NgFor, NgIf])
class ListComponent {
  List<String> friendNames;

  ListComponent(FriendsService friendsService) {
    this.friendNames = friendsService.names;
  }
}
