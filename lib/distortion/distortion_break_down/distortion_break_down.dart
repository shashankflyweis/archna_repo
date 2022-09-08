import 'package:archna_frontend/View/distortion/story3.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'distortion_overview.dart';

class Distortionbreakdown extends StatefulWidget {
  Distortionbreakdown({Key? key}) : super(key: key);

  @override
  State<Distortionbreakdown> createState() => _DistortionbreakdownState();
}

class _DistortionbreakdownState extends State<Distortionbreakdown> {
  //  String par = 0.4.toString();

  double par = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffc98f),
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: themAppcolor.withOpacity(0.01),
            leading:
                const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
            title: Text('Catastrophizing', style: text29)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 13.h,
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Learning about Catastrophizing \nthinking pattern",
                    style: text27,
                  ).pOnly(left: 7.h),
                  1.h.heightBox,
                  Row(
                    children: [
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 10000,
                        radius: 30,
                        lineWidth: 5,
                        percent: par,
                        progressColor: ratingcolor,
                        backgroundColor: Colors.white,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: CircleAvatar(
                          backgroundColor: wco,
                          radius: 12,
                          child: Icon(
                            Icons.play_arrow,
                            color: bco,
                          ),
                        ),
                      ).pOnly(left: 9.h),
                      5.w.widthBox,
                      Text(
                        // par.toString() + "%",
                        "${(par * 100).truncate()} % complete",
                        style: text28,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // constraints: const BoxConstraints(
                //   maxHeight: double.infinity,
                // ),
                height: 76.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.sp),
                        topLeft: Radius.circular(20.sp))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      2.h.heightBox,
                      Text(
                        "Lesson overview",
                        style: text29,
                      ),
                      2.h.heightBox,
                      Distortionoverview(
                        img: "assets/images/story.png",
                        title: "Story time",
                        subtit:
                            "Teaching mental health concepts with simple, relatable and interactive stories",
                      ),
                      2.h.heightBox,
                      Distortionoverview(
                        img: "assets/images/light-bulb.png",
                        title: "Introduction",
                        subtit:
                            "Let us do a quick recap of what catastrophizing is. ",
                      ),
                      2.h.heightBox,
                      Distortionoverview(
                        img: "assets/images/paper.png",
                        title: "Explanation",
                        subtit: "Let’s us deeeply understand by theory",
                      ),
                      2.h.heightBox,
                      Distortionoverview(
                        img: "assets/images/help.png",
                        title: "Helpfull strategies",
                        subtit:
                            "Let us now look at how we can generate these helpful thoughts",
                      ),
                      4.h.heightBox,
                      Container(
                        height: 8.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.sp)),
                        child: Center(
                          child: Text(
                            "Start Lesson",
                            style: text24,
                          ),
                        ),
                      ).onTap(() {
                        Get.to(() => Story3());
                      }),
                      4.h.heightBox,
                    ],
                  ).pSymmetric(h: 2.h),
                ),
              ),
            )
          ],
        ));
  }
}
