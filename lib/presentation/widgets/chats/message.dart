import 'package:ai_care/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class MessageType {
  final String message;
  final bool forSender;

  const MessageType({required this.message, required this.forSender});
}

class Message extends StatelessWidget {
  final String message;
  final bool forSender;

  const Message({super.key, required this.message, required this.forSender});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          forSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: forSender
                  ? AppColors.primary
                  : Color.fromARGB(255, 251, 250, 250),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2.0,
                  blurRadius: 5.0,
                  offset: Offset(0, 1.0),
                )
              ]),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Text(message,
              style: TextStyle(
                  color: forSender ? Colors.white : Colors.black,
                  fontSize: 17.0)),
        ),
      ],
    );
  }
}
