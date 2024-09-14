import 'package:flutter/material.dart';
import 'package:lydia/pagesScreen/ForgetPassword.dart';
import 'package:lydia/pagesScreen/SignIn.dart';
import 'package:lydia/pagesScreen/SignUp.dart';
import 'package:lydia/pagesScreen/WelcomPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome', // Set the initial route
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/forget-password': (context) => ForgetPasswordPage(),
      },
    );
  }
}
