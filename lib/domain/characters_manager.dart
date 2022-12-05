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

  Future<void> deleteCharacter(String id, String uid) async {
    final thisCollection = FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id);

    await thisCollection.doc('Skills').delete();
    await thisCollection.doc('Weapons').delete();
    await thisCollection.doc('About').delete();
    await thisCollection.doc('Eq').delete();
    await thisCollection.doc('Stats').delete();
  }
}

class Character {
  Character({required this.name, required this.game});
  final String name;
  final String game;
}
