// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:ai_care/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatMessageBox extends StatefulWidget {
  final Function(String) onSendPressed;

  const ChatMessageBox({super.key, required this.onSendPressed});

  @override
  State<ChatMessageBox> createState() => _ChatMessageBox();
}

class _ChatMessageBox extends State<ChatMessageBox> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Icon(Icons.send),
              onTap: () {
                if (_messageController.text.trim() == '') return;
                widget.onSendPressed(_messageController.text.trim());
                _messageController.clear();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
