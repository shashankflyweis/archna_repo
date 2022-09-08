import 'dart:ffi';

import 'package:archna_frontend/component/question_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/question_controller.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? selectedAns;

    var data2 = Get.arguments;

    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(
      children: [
        // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        Column(
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
                            (_questionController.stepcount.value + data2)
                                .toInt(),
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.black,
                        unselectedColor: Colors.grey,
                        roundedEdges: Radius.circular(10),
                      )),
                ),
              ],
            ),
            4.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.black)),
              ],
            ),
            2.h.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => Text.rich(
                  TextSpan(
                    text:
                        "Question ${_questionController.questionNumber.value}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "/${_questionController.questions.length}",
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
                physics: NeverScrollableScrollPhysics(),
                controller: _questionController.pageController,
                onPageChanged: _questionController.updateTheQnNum,
                itemCount: _questionController.questions.length,
                itemBuilder: (context, index) => QuestionCard(
                  question: _questionController.questions[index],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
