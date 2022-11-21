import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/edit/edit_mode_cubit.dart';
import 'package:zaliczenie/cubit/edit/edit_mode_state.dart';
import 'package:zaliczenie/pages/5charactersPage/widgets/charactres_list.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';
import 'package:zaliczenie/pages/widgets/floating_button.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingButton(
        icon: Icons.add_box_outlined,
        function: () {},
      ),
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
                return CharacterList(
                    height: MediaQuery.of(context).size.height, uid: uid);
              }
            },
          )),
          TextButton(
              onPressed: (() {
                BlocProvider.of<EditModeCubit>(context).isEditing();
              }),
              child: Text('xd')),
          CharacterList(
            height: MediaQuery.of(context).size.height,
            uid: uid,
          ),
          Text('data')
        ],
      ),
    );
  }
}
