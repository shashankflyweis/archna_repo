import 'package:archna_frontend/View/distortion/helpful3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Helpful2 extends StatefulWidget {
  const Helpful2({Key? key}) : super(key: key);

  @override
  State<Helpful2> createState() => _Helpful2State();
}

class _Helpful2State extends State<Helpful2> {
  @override
  Widget build(BuildContext context) {
    int count8 = Get.arguments;
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
                          currentStep: count8,
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
                          Get.to(() => Helpful3(), arguments: count8 + 20);
                        },
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.black)),
                  ],
                ),
                4.h.heightBox,
                Text(
                  "2. Finding the truth- Where is the   evidence?",
                  style: text30,
                ),
                2.h.heightBox,
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      2.h.heightBox,
                      Text(
                        "● In Catastrophizing we make a mountain out of a molehill. We magnify the worst case outcomes of a situation and start believing them to be true. In fact we believe so strongly in them that we are unable to consider any other possibilities. Like in Meera’s case, her thinking that not being able to run more than a few mins in the first run of her life means she will never be capable of running again. This is an extreme conclusion. We need to go back to the basics and start with analyzing the truth in it. ",
                        style: text25,
                      ),
                      1.h.heightBox,
                      Text(
                        "● We first start with the question- Where is the evidence to support that only the worst can happen? Have we checked the facts? What does statistics say? Did every marathon runner run the fastest and longest race, the first time they ran? Did they give up in the first try itself? Do you also approach other things in life in the same way? What about the things that you are good at?  For example at work or in school, don't you fail the first few times and gradually learn the tricks and techniques slowly? ",
                        style: text25,
                      ),
                      1.h.heightBox,
                      Text(
                        "● It is very unrealistic to expect ourselves to succeed in anything the first time itself. These are faulty expectations which we should learn to stay away from. We are also clearly ignoring how the body really works. To be able to run for at least 5-10 mins, you need to do a warm up. It's also common knowledge that we need to keep fit to have strong leg and body muscles that can take the weight while running.",
                        style: text25,
                      )
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
