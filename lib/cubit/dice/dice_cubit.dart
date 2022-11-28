import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zaliczenie/cubit/photo/photo_state.dart';

part 'dice_state.dart';

class DiceCubit extends Cubit<DiceState> {
  DiceCubit() : super(DiceInitial(CurrentDice.k4));

  CurrentDice get takeCurrentDiceValue {
    return (state as DiceInitial).currentDice;
  }

  void changeDice(String newDice) {
    switch (newDice) {
      case 'k4':
        emit(DiceInitial(CurrentDice.k4));
        break;
      case 'k6':
        emit(DiceInitial(CurrentDice.k6));
        break;
      case 'k8':
        emit(DiceInitial(CurrentDice.k8));
        break;
      case 'k10':
        emit(DiceInitial(CurrentDice.k10));
        break;
      case 'k12':
        emit(DiceInitial(CurrentDice.k12));
        break;
      case 'k20':
        emit(DiceInitial(CurrentDice.k20));
        break;
    }
  }
}
