import 'package:flutter/material.dart';

class BottomBarItem {
  final IconData icon;
  final String label;

  const BottomBarItem({
    required this.icon,
    required this.label,
  });
}

class BottomBar extends StatefulWidget {
  final List<BottomBarItem> items;
  final Color backgroundColor;
  final Color selectedColor;
  final Color selectedBackgroundColor;
  final Color unSelectedColor;
  final Function(int index) onChange;

  const BottomBar(
      {super.key,
      required this.items,
      required this.backgroundColor,
      required this.selectedColor,
      required this.unSelectedColor,
      required this.onChange,
      required this.selectedBackgroundColor});

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF5F5F5), width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          return InkWell(
            onTap: () {
              _onItemTapped(index);
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? widget.selectedBackgroundColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      widget.items[index].icon,
                      size: 26,
                      color: _currentIndex == index
                          ? widget.selectedColor
                          : widget.unSelectedColor,
                    ),
                    // add padding if not active item
                    const SizedBox(width: 8),
                    // show label if active item
                    _currentIndex == index
                        ? Text(
                            widget.items[index].label,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: widget.selectedColor,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                )),
          );
        }),
      ),
    ));
  }
}
