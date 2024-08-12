import 'package:flutter/material.dart';

class AccountInitView extends StatefulWidget {
  const AccountInitView({super.key});

  @override
  State<AccountInitView> createState() => _AccountInitViewState();
}

class _AccountInitViewState extends State<AccountInitView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Init account view"),
      ),
    );
  }
}
