import 'package:flutter/material.dart';
import 'home.dart'; // Make sure this import is correct

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jillian Dambrosca\'s Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          const MyHomePage(), // Ensure this matches the class name in home.dart
    );
  }
}
