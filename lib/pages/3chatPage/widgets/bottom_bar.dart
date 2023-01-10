import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/chat_manager.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.email,
    required this.userUid,
  });
  final String email;
  final String userUid;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Wiadomość',
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
          GestureDetector(
            child: Icon(
              Icons.send,
              size: MediaQuery.of(context).size.width * 0.13,
              color: Colors.red,
            ),
            onTap: () async {
              if (controller.text == '') {
              } else {
                var map;

                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(widget.userUid)
                    .get()
                    .then((value) => map = value.data());

                String userName = map['name'];
                await ChatManager.sendMessage(
                    controller.text.trim(), widget.email, userName);

                controller.text = '';
              }
            },
          )
        ],
      ),
    );
  }
}
