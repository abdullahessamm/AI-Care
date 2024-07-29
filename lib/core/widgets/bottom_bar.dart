import 'package:flutter/material.dart';

class BottomBarItem {
  final Icon icon;
  final String? label;

  const BottomBarItem({
    required this.icon,
    this.label,
  });
}

class BottomBar extends StatefulWidget {
  final List<BottomBarItem> items;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unSelectedColor;
  final Function(int index) onChange;

  const BottomBar(
      {super.key,
      required this.items,
      required this.backgroundColor,
      required this.selectedColor,
      required this.unSelectedColor,
      required this.onChange});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    widget.onChange(index);
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItems() {
    return widget.items.map((item) {
      return BottomNavigationBarItem(
        icon: item.icon,
        label: item.label,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _buildBottomNavigationItems(),
      onTap: _onItemTapped,
      currentIndex: _currentIndex,
      backgroundColor: widget.backgroundColor,
      selectedItemColor: widget.selectedColor,
      unselectedItemColor: widget.unSelectedColor,
      type: BottomNavigationBarType.fixed, // Add this line
    );
  }
}
