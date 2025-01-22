import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran/core/Colors/Textstyle/text_style.dart';
import 'package:quran/core/Images/images.dart';
import 'package:quran/features/future_login/view/screen/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('القرآن الكريم',
              style: textStyleapp().copyWith(color: Colors.green[600])),
          SizedBox(
              height: 259,
              width: double.infinity,
              child: Image.asset(Images.image11)),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            color: Colors.green,
          ),
          SizedBox(
            height: 15,
          ),
          Text('مرحبا',
              style: textStyleapp().copyWith(color: Colors.green[600])),
        ],
      ),
    );
  }
}
