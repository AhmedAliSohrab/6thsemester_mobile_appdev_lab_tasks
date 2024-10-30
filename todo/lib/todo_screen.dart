// todo_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';
import 'add_todo.dart';
import 'edit_todo.dart'; // Ensure you import EditTodo

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  subtitle: Text(
                      "${todos[index].description} - ${todos[index].date}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: Colors.green, // Set edit icon color to green
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTodo(todo: todos[index]),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red, // Set delete icon color to red
                        onPressed: () {
                          context.read<TodoProvider>().removeTodo(todos[index]);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text("Add Task"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTodo(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Delete All"),
                onPressed: () {
                  context.read<TodoProvider>().removeAll();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
