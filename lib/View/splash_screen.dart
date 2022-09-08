import 'dart:async';
import 'package:archna_frontend/View/onboarding_page.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Get.to(
              () => OnBoardingScreen(),
              transition: Transition.fadeIn,
              duration: Duration(seconds: 2),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColor(
          child: Center(
        child: Center(
          child: Text(
            "< app LOGO >",
            style: text1,
          ),
        ),
      )),
    );
  }
}
