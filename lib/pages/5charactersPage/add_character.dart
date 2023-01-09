import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/characters/characters_about_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_state.dart';
import 'package:zaliczenie/cubit/characters/characters_stats_cubit.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_about.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_row.dart';

class AddCharacter extends StatefulWidget {
  const AddCharacter({super.key});

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

  Map<String, String> about = {
    'xd': 'xd',
    'a1': 'a1',
  };
  Map<String, String> stats = {
    'xd': 'xd',
    'a2': 'a2',
  };
  Map<String, String> eq = {};
  Map<String, String> skills = {};
  Map<String, String> weapons = {};
  bool textFieldEnable = false;
  List<CharacterRow> characterRow = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: BlocProvider(
        create: (context) => CharactersAboutCubit(),
        child: CharacterAbout(),
      ),
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
/*

Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                switch (BlocProvider.of<CharactersCubit>(context).takeEditTab) {
                  case Edit.about:
                    print(
                        '\n${BlocProvider.of<CharactersCubit>(context).takeEditTab}\n');
                    return ListView(
                      children: characterRow,
                    );
                    break;
                  case Edit.stats:
                    print(
                        '\n${BlocProvider.of<CharactersCubit>(context).takeEditTab}\n');
                    return ListView(
                      children: characterRow,
                    );
                    break;

                  case Edit.skills:
                    print(
                        '\n${BlocProvider.of<CharactersCubit>(context).takeEditTab}\n');
                    return ListView(
                      children: characterRow,
                    );
                    break;
                  case Edit.eq:
                    print(
                        '\n${BlocProvider.of<CharactersCubit>(context).takeEditTab}\n');
                    return ListView(
                      children: characterRow,
                    );
                    break;
                  case Edit.weapons:
                    print(
                        '\n${BlocProvider.of<CharactersCubit>(context).takeEditTab}\n');
                    print(
                        BlocProvider.of<CharactersCubit>(context).takeEditTab);
                    return ListView(
                      children: characterRow,
                    );
                    break;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                      controller: keyController,
                      decoration: InputDecoration(
                        hintText: '',
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
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                      controller: valueController,
                      decoration: InputDecoration(
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
                GestureDetector(
                  child: Icon(
                    Icons.add,
                  ),
                  onTap: () {
                    print(selectedIndex);

                    switch (
                        BlocProvider.of<CharactersCubit>(context).takeEditTab) {
                      case Edit.stats:
                        print(BlocProvider.of<CharactersCubit>(context)
                            .takeEditTab);
                        bool isIn = true;
                        stats.keys.forEach((element) {
                          if (element == keyController.text) {
                            isIn = false;
                          }
                          if (isIn &&
                              keyController.text != '' &&
                              valueController != '') {
                            stats[keyController.text] = valueController.text;
                            keyController.text = '';
                            valueController.text = '';
                            BlocProvider.of<CharactersCubit>(context).changeTab(
                                BlocProvider.of<CharactersCubit>(context)
                                    .takeEditTab);
                          }
                        });
                        break;
                      case Edit.about:
                        print(BlocProvider.of<CharactersCubit>(context)
                            .takeEditTab);
                        bool isIn = true;
                        about.keys.forEach((element) {
                          if (element == keyController.text) {
                            isIn = false;
                          }
                        });
                        if (isIn &&
                            keyController.text != '' &&
                            valueController != '') {
                          about[keyController.text] = valueController.text;

                          keyController.text = '';
                          valueController.text = '';
                        }
                        BlocProvider.of<CharactersCubit>(context).changeTab(
                            BlocProvider.of<CharactersCubit>(context)
                                .takeEditTab);
                        break;
                      case Edit.eq:
                        bool isIn = true;
                        eq.keys.forEach((element) {
                          if (element == keyController.text) {
                            isIn = false;
                          }
                          if (isIn &&
                              keyController.text != '' &&
                              valueController != '') {
                            eq[keyController.text] = valueController.text;
                            eq.forEach((key, value) {});
                            keyController.text = '';
                            valueController.text = '';
                            BlocProvider.of<CharactersCubit>(context).changeTab(
                                BlocProvider.of<CharactersCubit>(context)
                                    .takeEditTab);
                          }
                        });
                        break;
                      case Edit.skills:
                        bool isIn = true;
                        skills.keys.forEach((element) {
                          if (element == keyController.text) {
                            isIn = false;
                          }
                          if (isIn &&
                              keyController.text != '' &&
                              valueController != '') {
                            skills[keyController.text] = valueController.text;
                            keyController.text = '';
                            valueController.text = '';
                            BlocProvider.of<CharactersCubit>(context).changeTab(
                                BlocProvider.of<CharactersCubit>(context)
                                    .takeEditTab);
                          }
                        });
                        break;
                      case Edit.weapons:
                        bool isIn = true;
                        weapons.keys.forEach((element) {
                          if (element == keyController.text) {
                            isIn = false;
                          }
                          if (isIn &&
                              keyController.text != '' &&
                              valueController != '') {
                            weapons[keyController.text] = valueController.text;

                            keyController.text = '';
                            valueController.text = '';
                            BlocProvider.of<CharactersCubit>(context)
                                .changeTab(Edit.weapons);
                          }
                        });
                        break;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
*/
