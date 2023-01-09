import 'package:flutter/material.dart';

class CharacterRow extends StatelessWidget {
  const CharacterRow({
    super.key,
    required this.mapKey,
    required this.mapValue,
    required this.fun,
  });
  final String mapKey;
  final String mapValue;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              mapKey,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(mapValue),
          ),
          GestureDetector(
            child: Icon(
              Icons.delete,
              size: 40,
            ),
            onTap: fun,
          ),
        ],
      ),
    );
  }
}
