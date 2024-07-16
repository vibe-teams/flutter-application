import 'package:flutter/material.dart';
import 'package:flutter_application/src/models/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> todoList = [
    Todo(
      id: '1',
      title: 'Todo 1',
      description: 'Description 1',
    ),
    Todo(
      id: '2',
      title: 'Todo 2',
      description: 'Description 2',
    ),
    Todo(
      id: '3',
      title: 'Todo 3',
      description: 'Description 3',
    ),
  ];

  void add(Todo todo) {
    todoList.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) {
    todoList.remove(todo);
    notifyListeners();
  }
}
