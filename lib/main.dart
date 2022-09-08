import 'package:archna_frontend/View/Home_screen.dart';
import 'package:archna_frontend/View/ScorePage/score_page.dart';
import 'package:archna_frontend/View/anxiety/anxiety_final_score%20.dart';
import 'package:archna_frontend/View/depression_screen/depression_final_score%20.dart';
import 'package:archna_frontend/View/distortion/story3.dart';
import 'package:archna_frontend/View/splash_screen.dart';
import 'package:archna_frontend/constant/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'lesson/lesson1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application
  // .
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
           home: SplashScreen(),
        );
      },
    );
  }
}
