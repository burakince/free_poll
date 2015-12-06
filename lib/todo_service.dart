library free_poll.todo_service;

import 'package:angular2/angular2.dart';

@Injectable()
class TodoService {
  List<String> todos = ['Eat breakfast', 'Walk dog', 'Breathe', 'Learn Angular'];
}
