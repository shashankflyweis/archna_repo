import 'package:archna_frontend/component/body.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/question_controller.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: themAppcolor,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
      //   ],
      // ),
      body: Body().paddingSymmetric(horizontal: 2.h),
    );
  }
}
