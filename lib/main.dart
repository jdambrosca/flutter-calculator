import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jillian Dambrosca\'s Calculator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(
              255, 160, 115, 177), // Light purple background color for AppBar
        ),
        primarySwatch:
            Colors.blue, // You can keep this as blue or change as needed
        scaffoldBackgroundColor:
            Colors.blue[100], // Background color of the app screen
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}
