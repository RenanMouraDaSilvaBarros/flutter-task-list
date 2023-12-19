import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.title,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: Colors.black), 
      ),
    );
  }
}
