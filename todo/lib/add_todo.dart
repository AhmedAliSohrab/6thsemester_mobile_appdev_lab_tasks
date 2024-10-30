// add_todo.dart
import 'package:flutter/material.dart';
import 'package:todo/todo_provider.dart';
import 'package:provider/provider.dart';
import 'todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController tc = TextEditingController();
  final TextEditingController dc = TextEditingController();
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: tc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16), // Spacing between fields
              TextFormField(
                controller: dc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16), // Spacing between fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date.toLocal().toString().split(' ')[0], // Format date
                    style: const TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    child: const Text("Choose date"),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2030));
                      if (pickedDate != null && pickedDate != date) {
                        setState(() {
                          date = pickedDate;
                        });
                      }
                    },
                  )
                ],
              ),
              const SizedBox(height: 16), // Spacing before the button
              ElevatedButton(
                child: const Text("Add"),
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    context.read<TodoProvider>().addTodo(
                      Todo(
                        title: tc.text,
                        description: dc.text,
                        date: date,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
