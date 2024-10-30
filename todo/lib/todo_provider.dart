import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

// todo_provider.dart
class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [
    Todo(title: "Play Batmen A. city", description: "rand", date: DateTime.now()),
  ];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo oldTodo, Todo newTodo) {
    final index = _todos.indexOf(oldTodo);
    if (index != -1) {
      _todos[index] = newTodo;
      notifyListeners();
    }
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void removeAll() {
    _todos.clear();
    notifyListeners();
  }
}
