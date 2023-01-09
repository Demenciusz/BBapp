import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zaliczenie/cubit/dice/dice_cubit.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial(Edit.about));

  Edit get takeEditTab {
    return (state as CharactersInitial).edit;
  }

  void changeTab(Edit edit) {
    print(edit);
    switch (edit) {
      case Edit.stats:
        emit(CharactersInitial(edit));

        break;
      case Edit.about:
        emit(CharactersInitial(edit));

        break;
      case Edit.eq:
        emit(CharactersInitial(edit));

        break;
      case Edit.skills:
        emit(CharactersInitial(edit));

        break;
      case Edit.weapons:
        emit(CharactersInitial(edit));
        break;
    }
  }
}
