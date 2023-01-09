import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/characters_manager.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.id,
    required this.name,
    required this.game,
    required this.uid,
  });

  final String name;
  final String game;
  final String id;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onLongPress: () {},
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.orange.shade700),
                )),
          ),
          GestureDetector(
            onLongPress: () {},
            child: SizedBox(
              child: Text(
                game,
                style: TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width * 0.25,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
              onTap: () async {},
              child: Icon(
                Icons.edit,
                color: Colors.yellow,
                size: 34,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
              onTap: () async {
                CharacterManager.deleteCharacter(uid, id);
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
                size: 34,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
