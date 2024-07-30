import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget implements MainViewPage {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();

  @override
  BottomBarItem getBottomBarItem() {
    return const BottomBarItem(
      icon: Icons.social_distance,
      label: 'Comminity',
    );
  }
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Community Page"));
  }
}
