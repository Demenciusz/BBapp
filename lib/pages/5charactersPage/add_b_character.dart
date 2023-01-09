import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/characters/characters_cubit.dart';
import 'package:zaliczenie/pages/5charactersPage/add_character.dart';

class AddBCharacter extends StatelessWidget {
  const AddBCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit(),
      child: AddCharacter(),
    );
  }
}
