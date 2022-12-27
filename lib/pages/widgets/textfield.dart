import 'package:flutter/material.dart';

InputDecoration kDecoratedTextField({required String hint}) {
  return InputDecoration(
    hintText: hint,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget kTextField({
  required TextEditingController controller,
  required double screenWidth,
  required String hint,
  required bool obscureText,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SizedBox(
      child: TextField(
          obscureText: obscureText,
          style: TextStyle(fontSize: 20),
          controller: controller,
          decoration: kDecoratedTextField(hint: hint)),
      width: screenWidth * 0.7,
    ),
  );
}

class MyTextField extends StatefulWidget {
  MyTextField(
      {required this.controller,
      required this.screenWidth,
      required this.hint,
      required this.obscureText});
  final TextEditingController controller;
  final double screenWidth;
  final String hint;
  final bool obscureText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        child: TextField(
          obscureText: widget.obscureText,
          style: TextStyle(fontSize: 20),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        width: widget.screenWidth * 0.7,
      ),
    );
  }
}
