import 'dart:convert'; // Added for JSON decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebrity API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Celebrity API LAB'),
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
  List? celebrities; // Nullable list to hold celebrity data
  bool isLoading = true; // Flag to show loading state
  String errorMessage = ''; // To store error messages

  Future<void> fetchData() async {
    try {
      final url = Uri.parse(
          "https://api.api-ninjas.com/v1/celebrity?name=Emma Watson"); // Celebrity API URL
      final response = await http.get(
        url,
        headers: {
          'X-Api-Key': 'gpwk4BI0FDpaBt/9UcPnMg==eg9kmrr4BRF0p3Pq' // Replace with your API key
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          celebrities = data; // Set the list of celebrities
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage))
                : ListView.builder(
                    itemCount: celebrities!.length,
                    itemBuilder: (context, index) {
                      final celebrity = celebrities![index];
                      return ListTile(
                        title: Text(celebrity['name']),
                        subtitle: Text('Net Worth: \$${celebrity['net_worth']}'),
                      );
                    },
                  ),
      ),
    );
  }
}
