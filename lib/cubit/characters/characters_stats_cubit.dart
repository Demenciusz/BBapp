import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:zaliczenie/cubit/characters/characters_state.dart';

class CharactersStatsCubit extends Cubit<CharactersState> {
  CharactersStatsCubit() : super(CharactersData({}));

  Map<String, String> get takeMap {
    return (state as CharactersData).map;
  }

  bool addToMap(String key, String value) {
    if ((state as CharactersData).map.containsKey(key) &&
        (state as CharactersData).map.containsValue(value)) {
      return false;
    } else {
      if (key != '') {
        Map<String, String> map = takeMap;
        print(map);
        map[key] = value;
        print(map);
        emit(CharactersData(map));

        return true;
      }
      return false;
    }
  }

  void deleteKey(String key) {
    Map<String, String> map = takeMap;
    map.remove(key);
    print(map);
    emit(CharactersData(map));
  }

  Future<void> saveCharacter(String id, String uid) async {
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Stats')
        .set(takeMap);
    clearMap();
  }

  Future<void> overrideCharacter(String id, String uid) async {
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Weapons')
        .delete();
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Weapons')
        .set(takeMap);
    clearMap();
  }

  void clearMap() {
    emit(CharactersData({}));
  }

  void downloadMap(String uid, String id) async {
    Map<String, String> map = {};
    Map<String, dynamic> map2 = {};
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Stats')
        .get();
    if (snap.data() != null) {
      map2 = snap.data() as Map<String, dynamic>;
      map2.forEach((key, value) {
        map[key] = value.toString();
      });
    }
    emit(CharactersData(map));
  }
}
