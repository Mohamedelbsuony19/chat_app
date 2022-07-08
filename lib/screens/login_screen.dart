import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constans.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/package/custom_botton.dart';
import 'package:scholar_chat/package/custom_text_field.dart';
import 'package:scholar_chat/screens/chat-screen.dart';
import 'package:scholar_chat/screens/resgister_screeen.dart';

import '../helper/show-snack-bar.dart';

class loginScreen extends StatefulWidget {
  static const String routeName = 'login';

  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool isLoading = false;
  String? email , password ;
  
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimarycolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  Image.asset('assets/images/scholar.png'),
                  Text('Scholar chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'pacifico',
                          fontSize: 32)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Log in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChange: (data){
                      email=data;
                    },
                    hint: 'write email',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChange: (data){
                      password=data;
                    },
                    hint: 'password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customBotton(
                    text: 'Log in',
                     onTap: () async {
                        if (formkey.currentState!.validate()) {
                          isLoading=true;
                          setState(() {
                            
                          });
                          try {
                            var aunth = FirebaseAuth.instance;
                            UserCredential user =
                                await aunth.signInWithEmailAndPassword(
                                    email: email!, password: password!);
                                    Navigator.pushNamed(context,chatScreen.routeName,arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password.') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('weak password')));
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Email already exisit')));
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('there was an erorr')));
                          }
                            showSnackBar('sucsses', context);
                          isLoading=false;
                          setState(() {
                            
                          });
                          
                        }else{
                          
                        }
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have An Acount',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, registerScreen.routeName);
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(color: Color.fromARGB(255, 197, 17, 26)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
