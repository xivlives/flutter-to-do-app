import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed1;
  const MyButton({super.key, required this.text, required this.onPressed1});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed1,
      color: Colors.cyan[800],
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.grey[100]),),
    );
  }
}