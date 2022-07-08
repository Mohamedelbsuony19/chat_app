import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
   CustomFormTextField({this.onChange, this.hint,this.obscureText=false});
String? hint;
bool? obscureText;
Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return 
          TextFormField(
             style: TextStyle(color: Colors.white),
            obscureText:obscureText!,
            validator: (data){
              if(data!.isEmpty){
                return 'Is Empty!!';
              }
            },
            onChanged:onChange ,
            decoration: InputDecoration(
              hintText:hint ,
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
              )
            ),
          );
  }
}