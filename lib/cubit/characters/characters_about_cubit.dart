import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:zaliczenie/cubit/characters/characters_state.dart';

class CharactersAboutCubit extends Cubit<CharactersState> {
  CharactersAboutCubit() : super(CharactersData({}));

  Map<String, String> get takeMap {
    return (state as CharactersData).map;
  }

  bool addToMap(String key, String value) {
    if ((state as CharactersData).map.containsKey(key)) {
      return false;
    } else {
      Map<String, String> map = takeMap;
      print(map);
      map[key] = value;
      print(map);
      emit(CharactersData(map));

      return true;
    }
  }

  void deleteKey(String key) {
    Map<String, String> map = takeMap;
    map.remove(key);
    print(map);
    emit(CharactersData(map));
  }

  Future<void> saveCharacter(String id) async {}
}
