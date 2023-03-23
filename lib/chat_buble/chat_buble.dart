import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message_models.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
  });

  final messageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , bottom: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
          color: primaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,

          ),
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    super.key,
    required this.message,
  });

  final messageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , bottom: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
            bottomLeft: Radius.circular(32.0),
          ),
          color: Color(0xff6c25be),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,

          ),
        ),
      ),
    );
  }
}

