import 'package:archna_frontend/View/distortion/helpful2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Helpful1 extends StatefulWidget {
  const Helpful1({Key? key}) : super(key: key);

  @override
  State<Helpful1> createState() => _Helpful1State();
}

class _Helpful1State extends State<Helpful1> {
  @override
  Widget build(BuildContext context) {
    int count7 = Get.arguments;
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
                        currentStep: count7,
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
                        Get.to(() => Helpful2(), arguments: count7 + 10);
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black)),
                ],
              ),
              4.h.heightBox,
              Text(
                "1. Work on the Unhelpful thinking pattern",
                style: text30,
              ),
              2.h.heightBox,
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    2.h.heightBox,
                    Text(
                      "● Let’s start with the Thought diary and note down the situation, thoughts, feelings, behaviors that are bothering us.",
                      style: text25,
                    ),
                    1.h.heightBox,
                    Text(
                      "● Identify the problematic thoughts and feelings that cause us to react.",
                      style: text25,
                    ),
                    1.h.heightBox,
                    Text(
                      "● Recognize the ones that indicate the distortion- Catastrophizing.- for example after going for a run today for the first time in our life and not being able to run much, we think of the worst case outcome of the situation Meera has the thought  “ it would never happen, everything seems to be over”. She feels sad. Similarly we can identify our thoughts and feelings indicative of the distortion.",
                      style: text25,
                    ),
                    1.h.heightBox,
                    Text(
                      "● Once we have identified the pattern that is the distortion, we can move on to the next step- finding the evidence behind those thoughts or beliefs.",
                      style: text25,
                    )
                  ],
                ),
              ),
              2.h.heightBox,
            ],
          ).pSymmetric(h: 2.h),
        ],
      ),
    ));
  }
}
