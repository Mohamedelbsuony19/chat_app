import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/helper/show-snack-bar.dart';
import 'package:scholar_chat/package/custom_botton.dart';
import 'package:scholar_chat/package/custom_text_field.dart';
import 'package:scholar_chat/screens/chat-screen.dart';
import 'package:scholar_chat/screens/login_screen.dart';

class registerScreen extends StatefulWidget {
  static const String routeName = 'registerScreen';

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  String? email;

  String? password;

  bool isLoading=false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xFF274460),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.15,
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
                      Text('Register',
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
                    onChange: (data) {
                      email = data;
                    },
                    hint: 'write email',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChange: (data) {
                      password = data;
                    },
                    hint: 'password',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customBotton(
                      text: 'Register',
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          isLoading=true;
                          setState(() {
                            
                          });
                          try {
                            var aunth = FirebaseAuth.instance;
                            UserCredential user =
                                await aunth.createUserWithEmailAndPassword(
                                    email: email!, password: password!);

                            Navigator.pushNamed(context, chatScreen.routeName);
                            
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
                        'already have An Acount',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                color: Color.fromARGB(255, 197, 17, 26)),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
