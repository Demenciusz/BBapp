import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  const Character({
    super.key,
    required this.fireId,
    required this.id,
    required this.name,
    required this.game,
  });
  final String fireId;
  final String name;
  final String game;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Text(name),
          Text(game),
          GestureDetector(
            child: Icon(Icons.edit),
          ),
          GestureDetector(
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
