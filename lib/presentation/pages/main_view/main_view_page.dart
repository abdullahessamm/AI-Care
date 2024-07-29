import 'package:ai_care/core/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

abstract class MainViewPage extends Widget {
  static const double bottomBarIconSize = 25;

  const MainViewPage({super.key});

  BottomBarItem getBottomBarItem();
}
