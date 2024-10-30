import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this line to import the necessary package

void main() {
  runApp(Forms());
}

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final TextEditingController _namec = TextEditingController();
  final TextEditingController _emailc = TextEditingController();
  final TextEditingController _passc = TextEditingController();
  final TextEditingController _numc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _namec,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    } else if (value.length < 3) {
                      return "Name must be at least 3 characters";
                    }
                    return null; // Return null if valid
                  },
                  decoration: InputDecoration(
                    label: const Text("Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
                
                SizedBox(height: 12), // Adds space between the fields

                TextFormField(
                  controller: _emailc,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!value.contains("@")) {
                      return "Please enter a valid email";
                    }
                    return null; // Return null if valid
                  },
                  decoration: InputDecoration(
                    label: const Text("Email"),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _emailc.clear();
                      },
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                
                SizedBox(height: 12),

                TextFormField(
                  controller: _passc,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null; // Return null if valid
                  },
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    border: UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  obscureText: _isObscure,
                ),
                SizedBox(height: 12), // Adds space between the button and the fields

                Builder(
                  builder: (BuildContext context) => ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Form submitted successfully"),
                            backgroundColor: Colors.green,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          ),
                        );
                      }
                      print("Hii this is GFG's SnackBar");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
