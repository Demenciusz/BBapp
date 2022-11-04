import 'package:flutter/material.dart';
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
    );
  }
}
