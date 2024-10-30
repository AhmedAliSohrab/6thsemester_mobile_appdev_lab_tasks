import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = Offset(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gestures Demo'),
        ),
        body: Center(
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _offset = Offset(_offset.dx + details.delta.dx,
                    _offset.dy + details.delta.dy);
              });
            },
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tap!'),
                ),
              );
            },
            onDoubleTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Double Tap!'),
                ),
              );
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Long Press!'),
                ),
              );
            },
            child: Transform.translate(
              offset: _offset,
              child: Container(
                color: Colors.blue,
                width: 300,
                height: 300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
