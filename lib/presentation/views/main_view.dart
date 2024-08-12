import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/core/widgets/ai_care_app_bar.dart';
import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:ai_care/presentation/pages/main_view/care_plan_page.dart';
import 'package:ai_care/presentation/views/doctors_view.dart';
import 'package:ai_care/presentation/views/health_tracker_view.dart';
import 'package:ai_care/presentation/views/reminders_view.dart';
import 'package:ai_care/presentation/views/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ai_care/presentation/pages/main_view/home_page.dart';
import 'package:ai_care/presentation/pages/main_view/chats_page.dart';
import 'package:ai_care/presentation/pages/main_view/community_page.dart';

// list of pages
const List<MainViewPage> _pages = [
  HomePage(),
  ChatsPage(),
  CommunityPage(),
  CarePlanPage()
];

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPageIndex = 0;
  final _appbarMenuItems = [
    {"value": "Doctors", "view": const DoctorsView()},
    {"value": "Health Tracker", "view": const HealthTrackerView()},
    {"value": "Reminders", "view": const RemindersView()},
    {"value": "Settings", "view": SettingsView()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: AiCareAppBar(
            title: "AI Care",
            showNotificationButton: true,
            menuItems: _appbarMenuItems
                .map((item) => item["value"] as String)
                .toList(),
            onMenuItemPressed: (index) {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) =>
                      _appbarMenuItems[index]["view"] as Widget));
            },
          )),
      bottomNavigationBar: BottomBar(
        backgroundColor: AppColors.accent,
        selectedColor: AppColors.primary,
        unSelectedColor: AppColors.bottomBarUnselectedColor,
        onChange: _changePage,
        items: _pages.map((page) => page.getBottomBarItem()).toList(),
        selectedBackgroundColor: AppColors.primary.withOpacity(0.17),
      ),
      body: _pages[_currentPageIndex],
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}
