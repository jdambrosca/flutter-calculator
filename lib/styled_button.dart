import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String label;
  final void Function(String) onPressed;

  const StyledButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink[100],
        minimumSize: const Size(70, 70),
        textStyle: const TextStyle(fontSize: 24),
      ),
      child: Text(label),
    );
  }
}
