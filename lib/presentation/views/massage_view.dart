// ignore_for_file: prefer_const_constructors

import 'package:ai_care/presentation/widgets/chats/message.dart';
import 'package:ai_care/presentation/widgets/chats/chat_message_box.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app_bar.dart';

class MessagesScreen extends StatefulWidget {
  final List<MessageType> messages;

  const MessagesScreen({super.key, required this.messages});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<MessageType> messages = [];

  @override
  void initState() {
    super.initState();
    messages = widget.messages.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ChatBottomBar(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AiCareAppBar(
            title: "Messages",
            showNotificationButton: false,
          )),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 5.0),
                      child: Message(
                        message: messages[index].message,
                        forSender: messages[index].forSender,
                      ),
                    );
                  }),
            ),
            ChatMessageBox(
              onSendPressed: (msg) {
                setState(() {
                  messages = List.from([
                    MessageType(message: msg, forSender: true),
                    ...messages
                  ]);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
