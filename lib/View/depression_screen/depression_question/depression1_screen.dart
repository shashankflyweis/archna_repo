import 'package:archna_frontend/View/depression_screen/depression_question/depression1_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../model1/depression_model.dart';
import 'depression_controller.dart';

class Depression extends StatefulWidget {
  Depression({Key? key, this.question}) : super(key: key);

  DepressionModel? question;

  @override
  State<Depression> createState() => _DepressionState();
}

class _DepressionState extends State<Depression> {
  @override
  Widget build(BuildContext context) {
    DepressionController depressionController = Get.put(DepressionController());

    return Scaffold(
      backgroundColor: Color(0xffffbe99),
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
                      text: " ${depressionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "of ${depressionController.questions.length}",
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
                        currentStep: depressionController.stepcount.value,
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
              controller: depressionController.pageController,
              onPageChanged: depressionController.updateTheQnNum,
              itemCount: depressionController.questions.length,
              itemBuilder: (context, index) => DepressionQuestion(
                question: depressionController.questions[index],
              ),
            ),
          ),
        ],
      ).pSymmetric(h: 2.h),
    );
  }
}
