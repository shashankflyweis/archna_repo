import 'package:archna_frontend/View/lesson_break_down/lesson_break_down_page.dart';
import 'package:archna_frontend/View/model/questionfield_model.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../distortion/score2.dart';

class SchoolTimeQuestion extends StatefulWidget {
  SchoolTimeQuestion({Key? key}) : super(key: key);

  @override
  State<SchoolTimeQuestion> createState() => _SchoolTimeQuestionState();
}

class _SchoolTimeQuestionState extends State<SchoolTimeQuestion> {
  // List<Question> questionList = contents();
  int currentQuestionIndex = 0;
  int score = 0;
  // Answer? selectedAnswer;
  // int data2 = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themAppcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                6.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(() => SchoolTimeQuestion());
                        },
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.black)),
                    InkWell(
                        onTap: () {
                          Get.to(() => SchoolTimeQuestion());
                        },
                        child: const Icon(Icons.arrow_forward_ios,
                            color: Colors.black))
                  ],
                ),
                8.h.heightBox,
                Text(
                  "Question ${currentQuestionIndex + 1}/${(contents.length.toString())}",
                  style: text30,
                ),
                3.h.heightBox,
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          contents[currentQuestionIndex].question,
                          style: text30,
                        ),
                        5.h.heightBox,
                        Container(
                          height: 15.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: TextFormField(
                            maxLines: 10,
                            decoration: const InputDecoration(
                                hintText: "Write your answer here",
                                border: InputBorder.none),
                          ).p12(),
                        ),
                        2.h.heightBox,
                      ],
                    ).pSymmetric(h: 2.h, v: 2.h),
                  ),
                ),
              ],
            ),
          ),
          _nextButton(),
        ],
      ).pSymmetric(
        h: 2.5.h,
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == contents.length - 1) {
      isLastQuestion = true;
    }

    return Center(
      child: InkWell(
        onTap: () {
          if (isLastQuestion) {
            Get.to(Score2());
          } else {
            setState(() {
              currentQuestionIndex++;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          height: 8.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15.sp)),
          child: Center(
            child: Text(
              "Submit",
              style: text22,
            ),
          ),
        ),
      ),
    );
  }
}
