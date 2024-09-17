import 'package:flutter/material.dart';
import 'styled_body_text.dart';
import 'styled_button.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/services.dart'; // Import this for handling key events

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayText = '';
  final FocusNode _focusNode =
      FocusNode(); // Focus node to capture keyboard input

  // Button press logic for both clicks and keypresses
  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _displayText = '';
      } else if (value == '=') {
        try {
          final expression = Expression.parse(_displayText);
          const evaluator = ExpressionEvaluator();
          final result = evaluator.eval(expression, {});
          _displayText = result.toString();
        } catch (e) {
          _displayText = 'Error';
        }
      } else {
        // Ensure spacing around operators for better parsing
        if (RegExp(r'^[+\-*/]$').hasMatch(value)) {
          _displayText += ' $value ';
        } else {
          _displayText += value;
        }
      }
    });
  }

  // Handle key press events
  void _handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final String key = event.logicalKey.keyLabel;

      // Handle Shift + '=' combination for '+'
      if (event.isShiftPressed && key == '=') {
        _buttonPressed('+');
      }
      // Handle individual key presses
      else if (key == 'Backspace') {
        setState(() {
          if (_displayText.isNotEmpty) {
            _displayText = _displayText.substring(0, _displayText.length - 1);
          }
        });
      } else if (key == 'Enter' || key == '=') {
        _buttonPressed('=');
      } else if (key == 'Escape') {
        _buttonPressed('C');
      } else if (RegExp(r'^[0-9+\-*/.]$').hasMatch(key)) {
        _buttonPressed(key);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus(); // Request focus for the widget on load
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Clean up the focus node when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jillian Dambrosca\'s Calculator'),
      ),
      body: RawKeyboardListener(
        // Add RawKeyboardListener to capture key events
        focusNode: _focusNode,
        autofocus: true,
        onKey: _handleKey, // Call the key handler
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.bottomRight,
                child: StyledBodyText(text: _displayText),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StyledButton(label: '7', onPressed: _buttonPressed),
                StyledButton(label: '8', onPressed: _buttonPressed),
                StyledButton(label: '9', onPressed: _buttonPressed),
                StyledButton(label: '/', onPressed: _buttonPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StyledButton(label: '4', onPressed: _buttonPressed),
                StyledButton(label: '5', onPressed: _buttonPressed),
                StyledButton(label: '6', onPressed: _buttonPressed),
                StyledButton(label: '*', onPressed: _buttonPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StyledButton(label: '1', onPressed: _buttonPressed),
                StyledButton(label: '2', onPressed: _buttonPressed),
                StyledButton(label: '3', onPressed: _buttonPressed),
                StyledButton(label: '-', onPressed: _buttonPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StyledButton(label: 'C', onPressed: _buttonPressed),
                StyledButton(label: '0', onPressed: _buttonPressed),
                StyledButton(label: '=', onPressed: _buttonPressed),
                StyledButton(label: '+', onPressed: _buttonPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
