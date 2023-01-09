import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/5charactersPage/add_character.dart';

class CharacterNameGamePage extends StatelessWidget {
  CharacterNameGamePage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController gameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                if (nameController.text.length > 3 &&
                    gameController.text.length > 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => AddCharacter(
                                name: nameController.text,
                                game: gameController.text,
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
    );
  }
}
