import 'dart:async';

import 'package:archna_frontend/View/start_question_screen.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class ThankYouScreen extends StatefulWidget {
  ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => StartQuestionScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColor(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/feel.png'),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Thanks for letting',
            style: text5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'us know!',
                style: text5,
              ),
              Image.asset('assets/images/smile.png'),
            ],
          )
        ],
      )),
    );
  }
}
