import 'package:archna_frontend/View/distortion/question/distortion_controller.dart';
import 'package:archna_frontend/View/distortion/question/distortion_question.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class DistortionScreen extends StatefulWidget {
  DistortionScreen({Key? key}) : super(key: key);

  @override
  State<DistortionScreen> createState() => _DistortionScreenState();
}

class _DistortionScreenState extends State<DistortionScreen> {
  DistortionController distortionController = Get.put(DistortionController());
  @override
  Widget build(BuildContext context) {
    int count3 = Get.arguments;
    return Scaffold(
      backgroundColor: themapp2,
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
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep:
                        distortionController.stepcount.value + count3 as int,
                    size: 8,
                    padding: 0,
                    selectedColor: Colors.black,
                    unselectedColor: Colors.grey,
                    roundedEdges: Radius.circular(10),
                  )),
            ],
          ),
          4.h.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child:
                      Icon(Icons.arrow_back_ios_outlined, color: Colors.black)),
              // InkWell(
              //     onTap: () {},
              //     child: Icon(Icons.arrow_forward_ios_outlined,
              //         color: Colors.black)),
            ],
          ),
          4.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  text: "Question ${distortionController.questionNumber.value}",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "/${distortionController.questions.length}",
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
              controller: distortionController.pageController,
              onPageChanged: distortionController.updateTheQnNum,
              itemCount: distortionController.questions.length,
              itemBuilder: (context, index) => DistortionQuestion(
                question: distortionController.questions[index],
              ),
            ),
          ),
        ],
      ).pSymmetric(h: 2.h),
    );
  }
}
