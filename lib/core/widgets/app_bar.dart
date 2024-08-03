// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_care/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AiCareAppBar extends StatefulWidget {
  final String title;
  bool showNotificationButton = true;
  AiCareAppBar(
      {super.key, required this.title, required this.showNotificationButton});

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
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: AppColors.primary,
                      size: 30,
                    ),
                    onPressed: () {
                      // Implement more options functionality here
                    },
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
