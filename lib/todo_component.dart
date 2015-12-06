library free_poll.todo_component;

import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:free_poll/todo_service.dart';

@Component(selector: 'my-todo', viewProviders: const [TodoService])
@View(
    template: '''
      <ul>
        <li *ng-for="#todo of todos">
          {{ todo }}
        </li>
      </ul>
      <input #todotext (keyup)="doneTyping(\$event)">
      <button (click)="addTodo(todotext.value);todotext.value=null">Add Todo</button>
    ''',
    directives: const [NgFor])
class TodoList {
  List<String> todos;

  TodoList(TodoService todoService) {
    this.todos = todoService.todos;
  }

  addTodo(String todo) {
    todos.add(todo);
  }

  doneTyping(KeyboardEvent event) {
    if (event.keyCode == KeyCode.ENTER) {
      InputElement e = event.target;
      addTodo(e.value);
      e.value = null;
    }
  }
}