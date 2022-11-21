import 'package:cloud_firestore/cloud_firestore.dart';

class CharacterManager {
  Future<List<Character>> makeList(String uid) async {
    List<Character> list = [];
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('Characters')
        .doc('new')
        .collection(uid)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    documents.forEach((element) {
      print(element.data());
      print('------------------------------------------');
      list.add(Character(
          name: element.data().toString(), game: element.data().toString()));
    });

    return list;
  }
}

class Character {
  Character({required this.name, required this.game});
  final String name;
  final String game;
}
