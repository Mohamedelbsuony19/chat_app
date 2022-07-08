import 'package:flutter/material.dart';
import 'package:scholar_chat/models/message.dart';

import '../constans.dart';

class chatBuble extends StatelessWidget {
final messageModell message;
  const chatBuble({ Key? key,required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 20,top: 16,bottom: 16,right: 20),
        decoration: BoxDecoration(
          color: kPrimarycolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topRight: Radius.circular(32)
          )
          ),
          child: Text(message.TextMessage,
          style: TextStyle(color: Colors.white,
          fontSize: 19),
          ),
      ),
    );
  }
}
class chatBubleForFrind extends StatelessWidget {
final messageModell message;
  const chatBubleForFrind({ Key? key,required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 20,top: 16,bottom: 16,right: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 59, 185, 162),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            topRight: Radius.circular(32)
          )
          ),
          child: Text(message.TextMessage,
          style: TextStyle(color: Colors.white,
          fontSize: 19),
          ),
      ),
    );
  }
}