import 'package:flutter/material.dart';

// this is just an example
class AppLayout extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Widget footer;

  const AppLayout(
      {super.key,
      required this.header,
      required this.body,
      required this.footer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        Expanded(child: body),
        footer,
      ],
    );
  }
}
