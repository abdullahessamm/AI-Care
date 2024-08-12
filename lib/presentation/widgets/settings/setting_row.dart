import 'package:ai_care/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final String label;
  final String? currentValue;
  final IconData iconData;
  final Color textColor;
  final Color iconColor;
  final bool showArrow;
  final Function? onTap;

  const SettingRow({
    super.key,
    required this.label,
    required this.iconData,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.showArrow = true,
    this.currentValue,
    this.onTap,
  });

  factory SettingRow.primary({
    required String label,
    required IconData iconData,
    String? currentValue,
    Function? onTap,
  }) =>
      SettingRow(
        label: label,
        currentValue: currentValue,
        iconData: iconData,
        iconColor: AppColors.primary,
        onTap: onTap,
      );

  factory SettingRow.error({
    required String label,
    required IconData iconData,
    String? currentValue,
    Function? onTap,
  }) =>
      SettingRow(
        label: label,
        iconData: iconData,
        currentValue: currentValue,
        iconColor: Colors.red,
        textColor: Colors.red,
        showArrow: false,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap != null ? onTap!() : null;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // icon container
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[100]),
                child: Center(
                  child: Icon(
                    iconData,
                    color: iconColor,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: textColor),
                  ),
                  currentValue != null
                      ? Text(
                          currentValue!,
                          style: const TextStyle(fontSize: 11),
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
          showArrow
              ? Icon(
                  Icons.chevron_right_rounded,
                  size: 30,
                  color: Colors.grey[400],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
