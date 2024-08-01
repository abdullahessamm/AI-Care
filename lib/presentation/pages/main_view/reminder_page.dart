import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:flutter/material.dart';

class ReminderPage extends StatefulWidget implements MainViewPage {
  const ReminderPage({super.key});
  @override
  State<ReminderPage> createState() => _ReminderPageState();

  @override
  BottomBarItem getBottomBarItem() {
    return const BottomBarItem(
      icon: Icons.alarm,
      label: 'Reminders',
    );
  }
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('alarm page');
  }
}
