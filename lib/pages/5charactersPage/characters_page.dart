import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/edit/edit_mode_cubit.dart';
import 'package:zaliczenie/cubit/edit/edit_mode_state.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(child: BlocBuilder<EditModeCubit, EditModeState>(
            builder: (context, state) {
              if (BlocProvider.of<EditModeCubit>(context).editingValue) {
                return Text(
                    '1 ${BlocProvider.of<EditModeCubit>(context).editingValue}');
              } else {
                return Text('2');
              }
            },
          )),
          TextButton(
              onPressed: (() {
                BlocProvider.of<EditModeCubit>(context).isEditing();
              }),
              child: Text('xd'))
        ],
      ),
    );
  }
}
