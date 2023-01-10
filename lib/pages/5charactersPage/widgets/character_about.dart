import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/characters/characters_about_cubit.dart';
import 'package:zaliczenie/cubit/characters/characters_state.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/character_row.dart';

class CharacterAbout extends StatelessWidget {
  CharacterAbout({
    super.key,
  });

  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  List<CharacterRow> characterRowList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BlocBuilder<CharactersAboutCubit, CharactersState>(
            builder: (context, state) {
              if (state is CharactersData) {
                print(state.map.length);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.map.length,
                  itemBuilder: (context, index) {
                    return CharacterRow(
                      mapKey: state.map.entries.elementAt(index).key,
                      mapValue: state.map.entries.elementAt(index).value,
                      fun: () => BlocProvider.of<CharactersAboutCubit>(context)
                          .deleteKey(state.map.entries.elementAt(index).key),
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                    controller: keyController,
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
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            bool b = BlocProvider.of<CharactersAboutCubit>(context)
                .addToMap(keyController.text, valueController.text);
            if (b) {
              FocusManager.instance.primaryFocus?.unfocus();
              keyController.clear();
              valueController.clear();
            }
          },
          child: Icon(
            Icons.add_circle_sharp,
            color: Colors.red,
            size: 40,
          ),
        )
      ],
    );
  }
}
