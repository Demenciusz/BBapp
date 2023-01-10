import 'package:flutter/material.dart';

import 'package:zaliczenie/pages/5charactersPage/character_name_game_page.dart';

import 'package:zaliczenie/pages/5charactersPage/widgets/characters_list.dart';

import 'package:zaliczenie/pages/widgets/drawer.dart';
import 'package:zaliczenie/pages/widgets/floating_button.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingButton(
        icon: Icons.add_box_outlined,
        function: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => CharacterNameGamePage(
                    uid: uid,
                  )),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Nazwa',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Gra',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Edytuj',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Usuń',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          CharactersList(uid: uid),
        ],
      ),
    );
  }
}
