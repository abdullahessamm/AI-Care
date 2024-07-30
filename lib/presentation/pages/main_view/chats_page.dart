import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:flutter/material.dart';

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
    return const Center(child: Text("Chats Page"));
  }
}
