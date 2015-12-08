library free_poll.todo_service;

import 'dart:convert' show JSON;
import 'dart:html' show Storage, window;

import 'package:angular2/angular2.dart' show Injectable;
import 'package:uuid/uuid.dart' show Uuid;

@Injectable()
class TodoService {
  List<String> todos = ['Eat breakfast', 'Walk dog', 'Breathe', 'Learn Angular'];

  List<Todo> newTodos = [];
  String filter;

  Storage get store => window.localStorage;

  TodoStore() {
    if (store['todos-angular2-dart'] != null) {
      loadTodos();
    }
  }

  List<Todo> get filteredTodos {
    switch (filter) {
      case 'completed':
        return getCompleted();
      case 'active':
        return getActive();
      default:
        return newTodos;
    }
  }

  void add(String title) {
    newTodos.add(new Todo(title));
    saveTodos();
  }

  bool allCompleted() => newTodos.length == getCompleted().length;

  List<Todo> getActive() => newTodos.where((todo) => !todo.completed).toList();

  List<Todo> getCompleted() => newTodos.where((todo) => todo.completed).toList();

  void loadTodos() {
    newTodos = JSON
        .decode(store['todos-angular2-dart'])
        .map((json) => new Todo.fromJSON(json))
        .toList();
  }

  void remove(String uid) {
    newTodos.removeWhere((newTodos) => newTodos.uid == uid);
    saveTodos();
  }

  void removeCompleted() {
    newTodos.removeWhere((newTodos) => newTodos.completed);
    saveTodos();
  }

  void saveEditing(Todo newTodos, String title) {
    newTodos.editing = false;

    if (title.isEmpty) {
      remove(newTodos.uid);
    } else {
      newTodos.title = title;
    }
    saveTodos();
  }

  void saveTodos() {
    store['todos-angular2-dart'] = JSON.encode(newTodos);
  }

  void setAllTo(bool completed) =>
      newTodos.forEach((Todo t) => t.completed = completed);

  void toggleCompletion(String uid) {
    Todo todo = newTodos.firstWhere((todo) => todo.uid == uid);
    todo.completed = !todo.completed;
    saveTodos();
  }
}

class Todo {
  bool completed = false;
  String title;
  final String uid = new Uuid().v4();
  bool editing = false;

  Todo(this.title);

  Todo.fromJSON(Map json)
      : title = json['title'],
        completed = json['completed'];

  Map toJson() => {'title': title, 'completed': completed};
}
