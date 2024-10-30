import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stateless Widget"),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),

        body: Center(
          child: const Text(
            "Hello World!",
            style: TextStyle(color: Colors.black, fontSize: 30),
            ),
        )
      )
    );
  }
}   // end of MyStatelessWidget

class MyStatefulWidget extends StatefulWidget {
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stateful Widget"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),

        body: Center(
          child: const Text(
            "Hello World!",
            style: TextStyle(color: Colors.black, fontSize: 30),
            ),
        )
      )
    );
  }
}

void main() {
  // runApp(MyStatelessWidget());
  runApp(MyStatefulWidget());
}