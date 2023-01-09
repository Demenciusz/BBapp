import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zaliczenie/cubit/characters/characters_state.dart';

class CharactersEqCubit extends Cubit<CharactersState> {
  CharactersEqCubit() : super(CharactersData({}));

  Map<String, String> get takeMap {
    return (state as CharactersData).map;
  }

  void addToMap(String key, String value) {
    emit(CharactersData({
      ...(state as CharactersData).map,
      key: value,
    }));
  }
}
