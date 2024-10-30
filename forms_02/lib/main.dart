import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  // For Checkbox
  bool football = false;
  bool wwe = false;
  bool cricket = false;

  // For Radio
  int? _selectedRadioValue = 0;

  // For Switch
  bool _isSwitched = false;

  // For dropdown
  final _games = ["Tomb Raider", "RD2", "GTA V", "The Witcher 3", "Cyberpunk 2077"];
  String _selectedGame = "Tomb Raider";

  // For Slider
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center( // Center widget to align the content in the middle of the screen
            child: Column(
              children: [
                SizedBox(height: 25.0),
                const Text(
                  "Checkboxes",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),
                ),
                CheckboxListTile(
                  title: const Text("Football"),
                  checkColor: Colors.blue,
                  activeColor: Colors.red,
                  hoverColor: Colors.green,
                  value: this.football,
                  onChanged: (bool? val) {
                    setState(() {
                      this.football = val ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("WWE"),
                  value: this.wwe,
                  onChanged: (bool? val) {
                    setState(() {
                      this.wwe = val ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Cricket"),
                  value: this.cricket,
                  onChanged: (bool? val) {
                    setState(() {
                      this.cricket = val ?? false;
                    });
                  },
                ),

                SizedBox(height: 25.0),
                const Text(
                  "Radio Buttons",
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),
                ),

                Column(
                  children: [
                    RadioListTile(
                      title: const Text("Male"),
                      value: 1,
                      groupValue: _selectedRadioValue,
                      onChanged: (int? value) {
                        setState(() {
                          this._selectedRadioValue = value;
                        });
                      },
                    ),

                    RadioListTile(
                      title: const Text("Female"),
                      value: 2,
                      groupValue: _selectedRadioValue,
                      onChanged: (int? value) {
                        setState(() {
                          this._selectedRadioValue = value;
                        });
                      },
                    ),
                    
                    SizedBox(height: 25.0),
                    const Text(
                      "Switch Example",
                      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),
                    ),

                    Switch(
                      value: _isSwitched,
                      onChanged: (val) {
                        setState(() {
                          this._isSwitched = !_isSwitched;
                        });
                      },
                    ),

                    SizedBox(height: 25.0),
                    const Text(
                      "Dropdown Example",
                      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),
                    ),

                    DropdownButton(
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                      value: _selectedGame,
                      items: _games.map((String game) {
                        return DropdownMenuItem(
                          value: game,
                          child: Text(game),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          this._selectedGame = value!;
                        });
                      },
                    ),

                    SizedBox(height: 25.0),

                    const Text(
                      "Slider Example",
                      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(height: 25.0),

                    Slider(
                      value: _sliderValue,
                      divisions: 100,
                      label: _sliderValue.round().toString(),
                      min: 0,
                      max: 150,
                      activeColor: Colors.red,
                      inactiveColor: Colors.green,
                      secondaryActiveColor: Colors.blue,
                      thumbColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          this._sliderValue = value;
                        });
                      },
                    ),

                    ElevatedButton(
                      child: Text("Print Values"),
                      onPressed: () {
                        // Print checkbox values
                        print("Football: $football");
                        print("WWE: $wwe");
                        print("Cricket: $cricket");

                        // Print selected radio value
                        String selectedGender = _selectedRadioValue == 1 ? "Male" : _selectedRadioValue == 2 ? "Female" : "None";
                        print("Selected Gender: $selectedGender");
                      },
                    ),
                  ],
                )
                
              ],
            ),
          ),
        )
      ),
    );
  }
}
