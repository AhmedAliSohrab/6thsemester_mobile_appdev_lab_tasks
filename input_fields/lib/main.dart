import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Fields Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Input Fields Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _checkboxValue = false;
  int _radioValue = 1;
  bool _switchValue = false;
  double _sliderValue = 0.0;
  String? _dropdownValue;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Checkbox(
                  value: _checkboxValue,
                  
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkboxValue = newValue ?? false;
                    });
                  },
                ),
                const Text('Tomb Raider'),
                SizedBox(width: 30),
                Checkbox(
                  value: _checkboxValue,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkboxValue = newValue ?? false;
                    });
                  },
                ),
                const Text('The Witcher 3'),
              ],
            ),
            
            const SizedBox(height: 16.0),

            // Radio Buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Radio Buttons'),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Male'),
                        leading: Radio<int>(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value ?? 1;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Female'),
                        leading: Radio<int>(
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value ?? 2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Switch
            SwitchListTile(
              title: const Text('Switch'),
              value: _switchValue,
              onChanged: (bool newValue) {
                setState(() {
                  _switchValue = newValue;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Slider
            Slider(
              value: _sliderValue,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (double newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Dropdown
            DropdownButton<String>(
              hint: const Text('Select an option'),
              value: _dropdownValue,
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownValue = newValue;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Text Field
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text Field',
              ),
            ),
            const SizedBox(height: 16.0),

            // Email Field
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter a valid email";
                } else if (!value.contains("@") && !value.contains(".com")) {
                  return "Please Enter a valid email";
                } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                    .hasMatch(value)) {
                  return "Please Enter a valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),

            // Password Field
            TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters long";
                  }
                  return null;
                },
              ),
            const SizedBox(height: 16.0),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                print('Checkbox: $_checkboxValue');
                print('Radio: $_radioValue');
                print('Switch: $_switchValue');
                print('Slider: $_sliderValue');
                print('Dropdown: $_dropdownValue');
                print('Text Field: ${_textController.text}');
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
