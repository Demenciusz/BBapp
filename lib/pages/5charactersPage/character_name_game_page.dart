import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/characters/characters_about_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_eq_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_skills_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_stats_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_weapons_cubit.dart';
import 'package:zaliczenie/pages/5charactersPage/add_character.dart';

class CharacterNameGamePage extends StatelessWidget {
  CharacterNameGamePage({
    super.key,
    required this.uid,
  });
  final String uid;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<CharactersAboutCubit>(context).clearMap();
        BlocProvider.of<CharactersStatsCubit>(context).clearMap();
        BlocProvider.of<CharactersSkillsCubit>(context).clearMap();
        BlocProvider.of<CharactersEqCubit>(context).clearMap();
        BlocProvider.of<CharactersWeaponsCubit>(context).clearMap();
        Navigator.pop(context);
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Nazwa postaci gracza',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                    controller: gameController,
                    decoration: InputDecoration(
                      hintText: 'Gra',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
              ),
              InkWell(
                onTap: (() {
                  if (nameController.text.length >= 2 &&
                      gameController.text.length >= 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => AddCharacter(
                                  name: nameController.text,
                                  game: gameController.text,
                                  uid: uid,
                                ))));
                  }
                }),
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 80,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
