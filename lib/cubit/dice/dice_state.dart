part of 'dice_cubit.dart';

abstract class DiceState extends Equatable {}

class DiceInitial extends DiceState {
  DiceInitial(this.currentDice);
  final CurrentDice currentDice;
  List<Object?> get props => [currentDice];
}

enum CurrentDice { k4, k6, k8, k10, k12, k20 }
