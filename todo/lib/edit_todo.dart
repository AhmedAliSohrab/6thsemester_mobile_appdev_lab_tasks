// edit_todo.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';
import 'todo.dart';

class EditTodo extends StatefulWidget {
  final Todo todo;

  const EditTodo({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final GlobalKey<FormState> _key = GlobalKey();
  late TextEditingController tc;
  late TextEditingController dc;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    tc = TextEditingController(text: widget.todo.title);
    dc = TextEditingController(text: widget.todo.description);
    date = widget.todo.date;
  }

  @override
  void dispose() {
    tc.dispose();
    dc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Todo"),
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
                child: const Text("Save"),
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    context.read<TodoProvider>().updateTodo(
                      widget.todo,
                      Todo(
                        title: tc.text,
                        description: dc.text,
                        date: date,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
