import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget implements MainViewPage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  BottomBarItem getBottomBarItem() {
    return const BottomBarItem(
      icon: Icons.home,
      label: "Home",
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Page"));
  }
}
