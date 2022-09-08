import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../model1/Anxiety_model.dart';
import 'anxiety1_question.dart';
import 'anxiety_controller.dart';

class AnxietyScreen extends StatelessWidget {
  AnxietyScreen({Key? key, this.question}) : super(key: key);

  AnxietyModel? question;

  @override
  Widget build(BuildContext context) {
    AnxietyController anxietyController = Get.put(AnxietyController());

    return Scaffold(
      backgroundColor: Color(0xffffe999),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          4.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: " ${anxietyController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "of ${anxietyController.questions2.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  1.h.heightBox,
                 Container(
                    width: 85.w,
                    child: Obx(() {
                      return StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: anxietyController.stepcount.value,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.black,
                        unselectedColor: Colors.grey,
                        roundedEdges: Radius.circular(10),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          4.h.heightBox,
          Expanded(
            child: PageView.builder(
              // Block swipe to next qn
              physics: NeverScrollableScrollPhysics(),
              controller: anxietyController.pageController1,
              onPageChanged: anxietyController.updateTheQnNum,
              itemCount: anxietyController.questions2.length,
              itemBuilder: (context, index) => AnxietyQuestion(
                question1: anxietyController.questions2[index],
              ),
            ),
          ),
        ],
      ).pSymmetric(h: 2.h),
    );
  }
}
