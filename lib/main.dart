import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/screens/chat-screen.dart';
import 'package:scholar_chat/screens/login_screen.dart';
import 'package:scholar_chat/screens/resgister_screeen.dart';

import 'firebase_options.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(scholarChat());
}
class scholarChat extends StatelessWidget {
  const scholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        loginScreen.routeName:(BuildContext)=>loginScreen(),
        registerScreen.routeName:(context)=>registerScreen(),
        chatScreen.routeName:(context) => chatScreen(),
      },
      initialRoute: loginScreen.routeName,
      home: loginScreen(),
    );
  }
}
