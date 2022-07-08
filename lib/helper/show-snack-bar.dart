import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void showSnackBar(String messge,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(messge)
    ),
    );
}