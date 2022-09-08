import 'package:archna_frontend/View/model/understanding_model.dart';
import 'package:archna_frontend/View/understanding/understanding1_question.dart';
import 'package:archna_frontend/View/understanding/understanding_controller.dart';
import 'package:archna_frontend/constant/contant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class UnderStanding1 extends StatelessWidget {
  UnderStanding1({Key? key, this.question}) : super(key: key);

  UnderStandingModel1? question;

  @override
  Widget build(BuildContext context) {
    UnderStandingController underStandingController =
        Get.put(UnderStandingController());

    

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
                          80,
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
          4.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  text:
                      "Question ${underStandingController.questionNumber.value}",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "/${underStandingController.questions.length}",
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
              controller: underStandingController.pageController,
              onPageChanged: underStandingController.updateTheQnNum,
              itemCount: underStandingController.questions.length,
              itemBuilder: (context, index) => UnderStandingQuestion(
                question: underStandingController.questions[index],
              ),
            ),
          ),
        ],
      ).pSymmetric(h: 2.h),
    );
  }
}
