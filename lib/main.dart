// @dart=2.9
import 'dart:io';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/layout/chat/chat_screen.dart';
import 'package:chat_app/layout/welcome_home/welcome_home_screen.dart';
import 'package:chat_app/modules/login/login_screen.dart';
import 'package:chat_app/modules/signup/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:
      {
        WelcomeHomeScreen.id: (context)=>WelcomeHomeScreen(),
        LoginScreen.id : (context)=>LoginScreen(),
        SignUpScreen.id: (context)=>SignUpScreen(),
        ChatScreen.id: (context)=>ChatScreen(),
      },
      initialRoute: WelcomeHomeScreen.id,
    );
  }
}
