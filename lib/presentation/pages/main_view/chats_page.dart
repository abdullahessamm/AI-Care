import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:ai_care/presentation/views/massage_view.dart';
import 'package:ai_care/presentation/widgets/chats/message.dart';
import 'package:flutter/material.dart';

import '../../../core/models/chat_model.dart';
import '../../widgets/chat_card.dart';

class ChatsPage extends StatefulWidget implements MainViewPage {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();

  @override
  BottomBarItem getBottomBarItem() {
    return const BottomBarItem(
      icon: Icons.chat,
      label: 'Chat',
    );
  }
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Expanded(
        child: ListView.builder(
          itemCount: ChatModelsData.length,
          itemBuilder: (context, index) => ChatCard(
            chat: ChatModelsData[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessagesScreen(
                  messages: [
                    MessageType(message: "hello", forSender: false),
                    MessageType(message: "hi", forSender: true)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
