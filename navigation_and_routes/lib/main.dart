import 'package:flutter/material.dart';

void main() {
  runApp(Navigation());
}


class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text('Go to Screen 2'),
            onPressed: () {
              // Pushes Screen 2 onto the stack (navigates forward)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen(data: 'Hello from Screen 1')),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  
  final String data;
  const SecondScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Go Back to Screen 1'),
              onPressed: () {
                // Pops the current screen off the stack (navigates back to Screen 1)
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 20),
          Center(child: Text(data)),
        ],
      )
          
    );
  }
}
