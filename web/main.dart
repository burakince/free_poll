library free_poll.web;

import 'package:angular2/bootstrap.dart';

import 'package:free_poll/app_component.dart';
import 'package:free_poll/my_name_component.dart';
import 'package:free_poll/time_component.dart';
import 'package:free_poll/list_component.dart';
import 'package:free_poll/todo_component.dart';
import 'package:free_poll/form_component.dart';

main() {
  bootstrap(AppComponent);
  bootstrap(MyNameComponent);
  bootstrap(TimeComponent);
  bootstrap(ListComponent);
  bootstrap(TodoList);
  bootstrap(FormComponent);
}
