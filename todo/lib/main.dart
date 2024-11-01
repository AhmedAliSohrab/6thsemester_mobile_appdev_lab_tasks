import 'package:flutter/material.dart';
import 'package:todo/todo_provider.dart';
import 'package:provider/provider.dart';
import 'todo_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => TodoProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}
