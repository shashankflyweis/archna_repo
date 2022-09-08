import 'package:archna_frontend/View/distortion/helpful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Theory extends StatefulWidget {
  Theory({Key? key}) : super(key: key);

  @override
  State<Theory> createState() => _IntroState();
}

class _IntroState extends State<Theory> {
  @override
  Widget build(BuildContext context) {
    int count5 = Get.arguments;
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
                        currentStep: count5,
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
                        Get.to(() => Helpful(), arguments: count5 + 10);
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
                "Now, let’s take a moment to think about why Catastrophizing is UNHELPFUL. Catastrophizing pushes us to make very big problems out of relatively small issues. When we do that, our feelings associated with big problems take over and we go into crisis mode. We are unable to think of practical simple solutions and end up making decisions like “let’s just give up!”",
                style: text28,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    2.h.heightBox,
                    Text(
                      "That first day was hard! But we learnt some real lessons - we need to start slow, make sure we warm up and not expect miracles!  ",
                      style: text25,
                    ),
                    1.h.heightBox,
                    Text(
                      "IMaybe we aren’t as fit as we were in school, but we can work our way up to a decent level of fitness",
                      style: text25,
                    ),
                    1.h.heightBox,
                    Text(
                      "I am glad we at least tried today! After months of just thinking about it and planning for it, we finally stepped out of the house and did something today. Yay!",
                      style: text25,
                    ),
                    1.h.heightBox,
                    Text(
                      "Any other HELPFUL thoughts you can think of here?",
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
