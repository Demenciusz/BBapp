import 'package:flutter/material.dart';

class ViewCharacter extends StatefulWidget {
  const ViewCharacter({super.key, required this.id});
  final String id;

  @override
  State<ViewCharacter> createState() => _ViewCharacterState();
}

class _ViewCharacterState extends State<ViewCharacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
