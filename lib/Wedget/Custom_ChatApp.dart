import 'package:flutter/material.dart';
import 'package:scholar_chat/Wedget/consts.dart';
import 'package:scholar_chat/model/Message.dart';

class Custom_ChatApp extends StatelessWidget {
  Custom_ChatApp({super.key, required this.message});
  final Messege message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:Color(0xff006385),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
            bottomLeft: Radius.circular(23),
          ),
        ),
        child: Text(
          message.messege,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Custom_ChatApp2 extends StatelessWidget {
  Custom_ChatApp2({super.key, required this.message});
  final Messege message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: primarykey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        child: Text(
          message.messege,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  
}
