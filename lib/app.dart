import 'package:flutter/material.dart';
import 'package:grocery_app/screens/address_form.dart';
import 'package:grocery_app/screens/login.dart';
import 'package:grocery_app/screens/otp.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/styles/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
