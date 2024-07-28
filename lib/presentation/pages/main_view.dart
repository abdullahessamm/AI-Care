import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home ')),
    const Center(child: Text('chat ')),
    const Center(child: Text('Comminity')),
    const Center(child: Text('Devices')),
  ];

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
        actions: [
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
          items: [
            {
              'label': 'Home',
              'icon': Icon(
                Icons.home,
                size: 25,
              ),
            },
            {
              'label': 'chat',
              'icon': Icon(
                Icons.chat,
                size: 25,
              ),
            },
            {
              'label': 'Comminity',
              'icon': Icon(Icons.social_distance, size: 25),
            },
            {
              'label': 'Devices',
              'icon': Icon(Icons.phone_android, size: 25),
            },
          ]),
      body: _pages[_currentPageIndex],
    );
  }
}
