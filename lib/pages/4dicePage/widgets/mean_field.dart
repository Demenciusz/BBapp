import 'package:flutter/material.dart';
import 'package:zaliczenie/cubit/dice/dice_cubit.dart';

class MeanField extends StatelessWidget {
  const MeanField({
    super.key,
    required this.currentDice,
  });
  final CurrentDice currentDice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(''),
          Text(''),
        ],
      ),
    );
  }
}
