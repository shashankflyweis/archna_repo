import 'package:archna_frontend/View/practices/prctic_question/practic_controller.dart';
import 'package:archna_frontend/View/practices/prctic_question/practic_questioncard.dart';
import 'package:archna_frontend/constant/contant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/practic_question_model.dart';

class PracticMainQuestion extends StatelessWidget {
  PracticMainQuestion({Key? key, this.question}) : super(key: key);

  PracticQuestionModel? question;

  @override
  Widget build(BuildContext context) {
    double data13 = Get.arguments;
    PracticController practicController = Get.put(PracticController());

    return Scaffold(
      backgroundColor: themAppcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          6.h.heightBox,
          Row(
            children: [
              Image.asset(
                "assets/images/canimg.png",
              ),
              3.w.widthBox,
              Container(
                width: 84.w,
                child: Obx(() => StepProgressIndicator(
                      totalSteps: 100,
                      currentStep:
                          (practicController.stepcount.value + data13).toInt(),
                      size: 8,
                      padding: 0,
                      selectedColor: Colors.black,
                      unselectedColor: Colors.grey,
                      roundedEdges: const Radius.circular(10),
                    )),
              ),
            ],
          ),
          4.h.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
              InkWell(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.black)),
            ],
          ),
          2.h.heightBox,
          Text(
              "Lets try to identify in the following statements whether these are thoughts or feelings",
              style: text25),
          4.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  text: "Question ${practicController.questionNumber.value}",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "/${practicController.questions.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          4.h.heightBox,
          Expanded(
            child: PageView.builder(
              // Block swipe to next qn
              physics: const NeverScrollableScrollPhysics(),
              controller: practicController.pageController,
              onPageChanged: practicController.updateTheQnNum,
              itemCount: practicController.questions.length,
              itemBuilder: (context, index) => PracticQuestion(
                question: practicController.questions[index],
              ),
            ),
          ),
        ],
      ).pSymmetric(h: 2.h),
    );
  }
}
