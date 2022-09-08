import 'package:archna_frontend/View/distortion/question/distortion_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int count = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            top: 9.h,
            child: Image.asset(
              "assets/images/leaf.gif",
              height: 80.h,
              width: 100.w,
              fit: BoxFit.fill,
            ),
          ),
          Container(height: 100.h, width: 100.w, color: themapp2),
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
                      child: StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: count,
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
                      child: Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.black)),
                  InkWell(
                      onTap: () {
                        Get.to(() => DistortionScreen(), arguments: count + 10);
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black)),
                ],
              ),
              4.h.heightBox,
              Text(
                "Introduction",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "Let us do a quick recap of what catastrophizing is. This is related to the phrase ‘Making a mountain out of a molehill’. This is where we make very big issues of relatively small and minor issues. ",
                style: text25,
              ),
              4.h.heightBox,
              Text(
                "Example",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "● If I don’t do really well in this presentation I will lose my job ",
                style: text25,
              ),
              2.h.heightBox,
              Text(
                "● If I don’t get through IIT I will never be financially stable.",
                style: text25,
              ),
              2.h.heightBox,
              Text(
                "● If I don’t get this home loan, I’ll never be able to buy a home in this life. ",
                style: text25,
              ),
              2.h.heightBox,
            ],
          ).pSymmetric(h: 2.h),
        ],
      ),
    ));
  }
}
