import 'package:flutter/material.dart';

class StyledBodyText extends StatelessWidget {
  final String text;

  const StyledBodyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
      textAlign: TextAlign.right,
    );
  }
}
