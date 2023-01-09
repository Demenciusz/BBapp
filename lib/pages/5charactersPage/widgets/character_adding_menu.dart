import 'package:flutter/material.dart';

class CharacterAddingMenu extends StatefulWidget {
  const CharacterAddingMenu({
    super.key,
    required this.rowList,
  });
  final List<Row> rowList;

  @override
  State<CharacterAddingMenu> createState() => _CharacterAddingMenuState();
}

class _CharacterAddingMenuState extends State<CharacterAddingMenu> {
  late final TextEditingController keyController;
  late final TextEditingController valueController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyController = TextEditingController();
    valueController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: widget.rowList,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextField(
              controller: keyController,
              decoration: InputDecoration(
                hintText: '',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextField(
              controller: valueController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
        ),
      ],
    );
  }
}
