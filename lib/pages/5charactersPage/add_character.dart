import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/characters/characters_about_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_eq_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_skills_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_stats_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_weapons_cubit.dart';
import 'package:zaliczenie/domain/characters_manager.dart';
import 'package:zaliczenie/domain/id_time.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_about.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_eq.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_row.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_skills.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_stats.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_weapons.dart';

class AddCharacter extends StatefulWidget {
  const AddCharacter({
    super.key,
    required this.name,
    required this.game,
    required this.uid,
  });
  final String name;
  final String game;
  final String uid;

  @override
  State<AddCharacter> createState() => _AddCharacterState();
}

class _AddCharacterState extends State<AddCharacter> {
  int selectedIndex = 0;
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool textFieldEnable = false;
  List<CharacterRow> characterRow = [];
  List<Widget> blocProviderList = [
    CharacterAbout(),
    CharacterStats(),
    CharacterSkils(),
    CharacterEq(),
    CharacterWeapons(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: (() {
                String id = IdTime.idByTime();
                CharacterManager.addCharacter(
                    widget.uid, widget.game, widget.name, id);
                BlocProvider.of<CharactersAboutCubit>(context)
                    .saveCharacter(id, widget.uid);
                BlocProvider.of<CharactersStatsCubit>(context)
                    .saveCharacter(id, widget.uid);
                BlocProvider.of<CharactersSkillsCubit>(context)
                    .saveCharacter(id, widget.uid);
                BlocProvider.of<CharactersEqCubit>(context)
                    .saveCharacter(id, widget.uid);
                BlocProvider.of<CharactersWeaponsCubit>(context)
                    .saveCharacter(id, widget.uid);
                Navigator.pop(context);
                Navigator.pop(context);
              }),
              child: Icon(
                Icons.save,
                size: 30,
              ),
            ),
          )
        ],
        backgroundColor: Colors.red,
      ),
      body: blocProviderList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.amber,
        selectedLabelStyle: TextStyle(color: Colors.red),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.description,
            ),
            label: 'Opis',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: 'Statystyki',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Umiejętności',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.backpack,
            ),
            label: 'Ekwipunek',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.gavel,
            ),
            label: 'Bronie',
          )
        ],
      ),
    );
  }
}
