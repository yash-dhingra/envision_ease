// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:envision_ease/Components/my_button.dart';
import 'package:envision_ease/pages/home_page.dart';
import 'package:envision_ease/pages/login_page.dart';
import 'package:envision_ease/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        'homePage': (context) => HomePage(),
        'login_page': (context) => LoginPage(),
        'main_page': (context) => MainPage(),
        'my_button': (context) => MyButton(),
      },
    );
  }
}
