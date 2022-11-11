import 'package:equatable/equatable.dart';

abstract class EditModeState extends Equatable {}

class EditModeInitial extends EditModeState {
  EditModeInitial(this.editing);
  final bool editing;

  @override
  List<Object?> get props => [editing];
}
