import 'package:flutter/material.dart';

class CharacterRow extends StatelessWidget {
  const CharacterRow({
    super.key,
    required this.mapKey,
    required this.mapValue,
  });
  final String mapKey;
  final String mapValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(mapKey),
        Text(mapValue),
        Icon(Icons.delete),
      ],
    );
  }
}
