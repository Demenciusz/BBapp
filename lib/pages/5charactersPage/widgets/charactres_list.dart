import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zaliczenie/domain/characters_manager.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({required this.height, required this.uid});
  final double height;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.3,
      child: FutureBuilder<List<Character>>(
          future: CharacterManager().makeList(uid),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else
              return CircularProgressIndicator();
          })),
    );
  }
}
