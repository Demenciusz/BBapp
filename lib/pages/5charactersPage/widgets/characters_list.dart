import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key, required this.uid});
  final String uid;

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Characters')
          .doc(widget.uid)
          .collection('Char')
          .snapshots(),
      builder: (context, snapshot) {
        List<CharacterWidget> charactersWidget = [];
        if (snapshot.hasData) {
          final characters = snapshot.data!.docs;
          for (var character in characters) {
            final map = character.data() as Map;
            String name = map['name'];
            String game = map['game'];
            String id = map['id'];
            charactersWidget.add(CharacterWidget(
              uid: widget.uid,
              id: id,
              name: name,
              game: game,
            ));
          }
          return Expanded(
            child: ListView(
              children: charactersWidget,
            ),
          );
        }

        return Center(
          child: Text('Nie masz postaci'),
        );
      },
    );
  }
}
