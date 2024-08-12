import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:ai_care/presentation/pages/main_view/main_view_page.dart';
import 'package:flutter/material.dart';

class CarePlanPage extends StatefulWidget implements MainViewPage {
  const CarePlanPage({super.key});

  @override
  State<CarePlanPage> createState() => CarePlanPageState();

  @override
  BottomBarItem getBottomBarItem() {
    return const BottomBarItem(
      icon: Icons.assessment_rounded,
      label: "Care Plan",
    );
  }
}

class CarePlanPageState extends State<CarePlanPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Care Plan Page"));
  }
}
