import 'package:archna_frontend/View/distortion/score2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Helpful3 extends StatefulWidget {
  const Helpful3({Key? key}) : super(key: key);

  @override
  State<Helpful3> createState() => _Helpful3State();
}

class _Helpful3State extends State<Helpful3> {
  @override
  Widget build(BuildContext context) {
    int count10 = Get.arguments;
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
          Container(
            height: 100.h,
            width: 100.w,
            color: themapp2,
            child: Column(
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
                          currentStep: count10,
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
                          Get.to(
                            () => Score2(),
                          );
                        },
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.black)),
                  ],
                ),
                4.h.heightBox,
                Text(
                  "3. Developing a whole perspective- Decatastrophizing",
                  style: text30,
                ),
                2.h.heightBox,
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      2.h.heightBox,
                      Text(
                        "● Decatastrophizing is a specific technique that works by asking you to consider different possibilities or outcomes for your situation. We start by asking- What else is really possible? What is the probability that my worst fear will come true? What is the possibility that other outcomes can also happen? Give them a percentage like 90% or 10%. Then try to validate your assumptions for why you think only your worst fear will come true. Why is something else not possible? Is it possible that I may be simply overthinking this? Am I just worrying too much? Sometimes talking to another person may also help to get a fresh perspective",
                        style: text25,
                      ),
                      1.h.heightBox,
                    ],
                  ),
                ),
                2.h.heightBox,
              ],
            ).pSymmetric(h: 2.h),
          )
        ],
      ),
    ));
  }
}
