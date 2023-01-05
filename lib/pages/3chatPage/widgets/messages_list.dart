import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/3chatPage/widgets/message_widget.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  late final ScrollController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs;
          List<MessageWidget> messagesWidgets = [];

          for (var message in messages) {
            final map = message.data() as Map;
            final messageText = map['text'];
            final messageSender = map['sender'];
            final messageUser = map['name'];
            final id = map['id'];
            messagesWidgets.add(MessageWidget(
              text: messageText,
              sender: messageSender,
              userEmail: widget.email,
              userName: messageUser,
              id: id,
            ));
          }
          return Expanded(
            child: ListView(
              reverse: true,
              controller: controller,
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 2,
              ),
              children: messagesWidgets.reversed.toList(),
            ),
          );
        } else
          return Text('');
      },
      stream: FirebaseFirestore.instance.collection('Messages').snapshots(),
    );
  }
}
