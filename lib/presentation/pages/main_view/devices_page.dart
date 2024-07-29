import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:flutter/material.dart';

class DevicesPage extends StatefulWidget implements MainViewPage {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();

  @override
  BottomBarItem getBottomBarItem() {
    return const BottomBarItem(
      icon: Icon(Icons.phone_android, size: MainViewPage.bottomBarIconSize),
      label: 'Devices',
    );
  }
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Devices Page"));
  }
}
