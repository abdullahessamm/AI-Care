// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_care/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AiCareAppBar extends StatefulWidget {
  final String title;
  final List<String> menuItems;
  final Function(int)? onMenuItemPressed;
  final bool showNotificationButton;

  const AiCareAppBar(
      {super.key,
      required this.title,
      required this.menuItems,
      this.onMenuItemPressed,
      this.showNotificationButton = false});

  @override
  State<AiCareAppBar> createState() => _AiCareAppBar();
}

class _AiCareAppBar extends State<AiCareAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xfff5f5f5))),
          color: AppColors.textColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary),
                        boxShadow: [
                          BoxShadow(color: AppColors.primary, blurRadius: 5),
                        ]),
                    child: CircleAvatar(
                      radius: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.title,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.showNotificationButton
                      ? IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: AppColors.primary,
                            size: 30,
                          ),
                          onPressed: () {
                            // Implement search functionality here
                          },
                        )
                      : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (context) =>
                          widget.menuItems.asMap().entries.map((entry) {
                        return PopupMenuItem(
                          value: entry.value,
                          onTap: () {
                            if (widget.onMenuItemPressed != null) {
                              widget.onMenuItemPressed!(entry.key);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(entry.value),
                          ),
                        );
                      }).toList(),
                      child: Icon(
                        Icons.more_vert,
                        color: AppColors.primary,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
