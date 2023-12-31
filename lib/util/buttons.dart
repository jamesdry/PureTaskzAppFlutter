import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TheButtons extends StatelessWidget {
  final String text;
  VoidCallback onButtonPressed;
  TheButtons({super.key, required this.text, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onButtonPressed,
      color: Colors.yellow,
      child: Text(text, style: const TextStyle(fontSize: 30.0)),
    );
  }
}
