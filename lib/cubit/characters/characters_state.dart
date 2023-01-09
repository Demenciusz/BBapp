part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();
}

class CharactersInitial extends CharactersState {
  final Edit edit;
  CharactersInitial(this.edit);
  @override
  List<Object> get props => [];
}

enum Edit {
  stats,
  about,
  eq,
  skills,
  weapons,
}
