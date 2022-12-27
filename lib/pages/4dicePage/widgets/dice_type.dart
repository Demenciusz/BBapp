import 'package:flutter/material.dart';
import 'package:zaliczenie/cubit/dice/dice_cubit.dart';

class DiceType extends StatelessWidget {
  const DiceType({
    super.key,
    required this.diceTypeText,
    required this.function,
    required this.currentDice,
  });
  final String diceTypeText;
  final VoidCallback function;
  final String currentDice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        width: 100,
        height: 50,
        child: Text(
          '$diceTypeText',
          style: TextStyle(
            fontSize: 38,
            color: 'CurrentDice.$diceTypeText' == currentDice
                ? Colors.red
                : Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
