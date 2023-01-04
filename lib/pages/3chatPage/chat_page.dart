import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/chat_manager.dart';
import 'package:zaliczenie/pages/3chatPage/widgets/bottom_bar.dart';
import 'package:zaliczenie/pages/3chatPage/widgets/message_widget.dart';
import 'package:zaliczenie/pages/3chatPage/widgets/messages_list.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.email, required this.uid});
  final String email;
  final String uid;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MessagesList(email: widget.email),
          BottomBar(
            email: widget.email,
            userUid: widget.uid,
          ),
        ],
      ),
    );
  }
}
