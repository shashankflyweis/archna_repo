import 'package:archna_frontend/View/practices/practices1_screen.dart';
import 'package:archna_frontend/models/variables/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class ExerciseScreen2 extends StatefulWidget {
  ExerciseScreen2({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen2> createState() => _ExerciseScreen2State();
}

class _ExerciseScreen2State extends State<ExerciseScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Container(height: 200.h, width: 100.w, color: themAppcolor),
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
                        totalSteps: service.total,
                        currentStep: service.step,
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
                  Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                  InkWell(
                      onTap: () {
                        service.step++;
                        Get.to(Practices1(), arguments: 60);
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black)),
                ],
              ),
              4.h.heightBox,
              Text(
                "Theory",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "Now that we have understood how we respond to situations, let’s go a little deeper and understand the basics a little better.",
                style: text25,
              ),
              4.h.heightBox,
              Text(
                "Thoughts",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "The internal dialogue that goes on in our minds at all times. It could be an idea or an opinion.",
                style: text25,
              ),
              2.h.heightBox,
              Text(
                "Example",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "I wish it would be cooler today.",
                style: text25,
              ),
              2.h.heightBox,
              Text(
                "Feelings",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "Our emotional state at a given time.",
                style: text28,
              ),
              2.h.heightBox,
              Text(
                "Example",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "anxious, happy, sad, frustrated, etc.",
                style: text25,
              ),
              2.h.heightBox,
            ],
          ).pSymmetric(h: 2.h),
        ],
      ),
    );
  }
}
