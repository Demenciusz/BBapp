import 'package:flutter/material.dart';

class DiceType extends StatelessWidget {
  const DiceType(
      {super.key, required this.diceTypeText, required this.function});
  final String diceTypeText;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        width: 30,
        height: 20,
        child: Text('$diceTypeText'),
      ),
    );
  }
}
