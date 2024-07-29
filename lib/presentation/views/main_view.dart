import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:flutter/material.dart';
import 'package:ai_care/presentation/pages/main_view/home_page.dart';
import 'package:ai_care/presentation/pages/main_view/chats_page.dart';
import 'package:ai_care/presentation/pages/main_view/community_page.dart';
import 'package:ai_care/presentation/pages/main_view/devices_page.dart';

// list of pages
const List<MainViewPage> _pages = [
  HomePage(),
  ChatsPage(),
  CommunityPage(),
  DevicesPage(),
];

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPageIndex = 0;

  void changePage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: const [
          Icon(
            Icons.person,
            size: 25,
            color: Colors.white,
          )
        ],
      ),
      bottomNavigationBar: BottomBar(
          backgroundColor: AppColors.primary,
          selectedColor: Colors.red,
          unSelectedColor: Colors.blue,
          onChange: changePage,
          items: _pages.map((page) => page.getBottomBarItem()).toList()),
      body: _pages[_currentPageIndex],
    );
  }
}
