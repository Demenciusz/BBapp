import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/edit/edit_mode_cubit.dart';
import 'package:zaliczenie/cubit/edit/edit_mode_state.dart';
import 'package:zaliczenie/domain/characters_manager.dart';
import 'package:zaliczenie/pages/5charactersPage/add_character.dart';
import 'package:zaliczenie/pages/5charactersPage/character_name_game_page.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character.dart';
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
          /*
          CharacterManager.addCharacter(uid, 'D&D', 'Grogggg', {
            'race': 'Orc',
            'sex': 'male',
          });
          */
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => CharacterNameGamePage()),
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
