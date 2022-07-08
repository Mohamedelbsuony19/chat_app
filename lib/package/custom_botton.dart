import 'package:flutter/material.dart';

class customBotton extends StatelessWidget {
   customBotton({this.onTap, required this.text}) ;
String? text;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
                width: MediaQuery.of(context).size.width*.95,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(text!,textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22)
                  ),
              ),
    )
;
  }
}