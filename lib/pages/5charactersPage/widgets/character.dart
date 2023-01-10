import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/characters_manager.dart';
import 'package:zaliczenie/pages/5charactersPage/view_character.dart';

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
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.orange.shade700),
              )),
          SizedBox(
            child: Text(
              game,
              style: TextStyle(fontSize: 20, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ViewCharacter(
                            id: id, uid: uid, name: name, game: game))));
              },
              child: Icon(
                Icons.remove_red_eye_sharp,
                color: Colors.yellow,
                size: 34,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
              onTap: () {
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
