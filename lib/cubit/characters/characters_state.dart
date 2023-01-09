import 'package:equatable/equatable.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersData extends CharactersState {
  final Map<String, String> map;
  CharactersData(this.map);
  @override
  List<Object> get props => [map, identityHashCode(this)];
}
