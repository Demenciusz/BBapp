import 'package:flutter/material.dart';

Padding kTextButton({
  required double screenWidth,
  required VoidCallback onPressed,
  required String content,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      width: screenWidth * 0.7,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            content,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    ),
  );
}

class MyTextButton extends StatelessWidget {
  MyTextButton(
      {required this.screenWidth,
      required this.onPressed,
      required this.content});

  final double screenWidth;
  final VoidCallback onPressed;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        width: screenWidth * 0.7,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              content,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
