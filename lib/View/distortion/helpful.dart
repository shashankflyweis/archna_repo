import 'package:archna_frontend/View/distortion/helpful1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Helpful extends StatefulWidget {
  Helpful({Key? key}) : super(key: key);

  @override
  State<Helpful> createState() => _HelpfulState();
}

class _HelpfulState extends State<Helpful> {
  @override
  Widget build(BuildContext context) {
    int count6 = Get.arguments;
    return Scaffold(
      backgroundColor: themapp2,
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            // color: Colors.red,
          ).pSymmetric(h: 2.h),
          Positioned(
              top: 64.h,
              left: -22.h,
              right: -22.h,
              child: Image.asset(
                "assets/images/wave.gif",
                width: 100.w,
                fit: BoxFit.fill,
              )),
          Column(
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
                      currentStep: count6, //data10.toInt(),
                      size: 8,
                      padding: 0,
                      selectedColor: Colors.black,
                      unselectedColor: Colors.grey,
                      roundedEdges: Radius.circular(10),
                    ),
                  ),
                ],
              ),
              3.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(() => Helpful1(), arguments: count6 + 10);
                      },
                      child: Icon(Icons.arrow_forward_ios, color: Colors.black))
                ],
              ),
              10.h.heightBox,
              Container(
                height: 20.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: Color(0xffDBA66D),
                    borderRadius: BorderRadius.circular(60.sp)),
                child: Center(
                  child: Image.asset(
                    "assets/images/puzzle.png",
                    height: 8.h,
                    width: 16.w,
                  ),
                ),
              ),
              2.h.heightBox,
              Text(
                "Helpful Strategies",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "Let us now look at how we can generate these helpful thoughts when we are indulging in catastrophizing.",
                textAlign: TextAlign.center,
                style: text25,
              ),
            ],
          ).pSymmetric(h: 2.h)
        ],
      ),
    );
  }
}
