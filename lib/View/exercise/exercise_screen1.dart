import 'package:archna_frontend/View/exercise/exercise2_screen.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:archna_frontend/models/variables/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class ExerciseScreen1 extends StatefulWidget {
  ExerciseScreen1({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen1> createState() => _ExerciseScreen1State();
}

class _ExerciseScreen1State extends State<ExerciseScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themAppcolor,
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            // color: Colors.red,
          ).pSymmetric(h: 2.h),
          Positioned(
              top: 15.h,
              left: -22.h,
              right: -22.h,
              child: Lottie.asset(
                "assets/images/wave3.json",
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
                      totalSteps: service.total,
                      currentStep: service.step,
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
                        service.step++;
                        Get.to(() => ExerciseScreen2(), arguments: 60);
                      },
                      child: Icon(Icons.arrow_forward_ios, color: Colors.black))
                ],
              ),
              10.h.heightBox,
              Container(
                height: 20.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: Color(0xff9EB9A0),
                    borderRadius: BorderRadius.circular(60.sp)),
                child: Center(
                  child: Image.asset(
                    "assets/images/prnimg.png",
                    height: 8.h,
                    width: 16.w,
                  ),
                ),
              ),
              2.h.heightBox,
              Text(
                "Exercise",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "Let’s deep dive into thoughts and feelings",
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
