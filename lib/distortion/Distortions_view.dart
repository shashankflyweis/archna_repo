import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/contant1.dart';
import 'distortion_break_down/distortion_break_down.dart';

class Distortionsview extends GetView<Distortionsview> {
  const Distortionsview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Cognitive distortions", style: text27),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffc07c)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/latest.png',
                      scale: 3,
                    ),
                    1.h.heightBox,
                    Text('All or nothing or Black and White', style: text27),
                    0.5.h.heightBox,
                    Text('Thinking', style: text27),
                    1.h.heightBox,
                    const Text(
                        'Learning about “All or nothing” \nor Black and white thinking pattern')
                  ],
                ).p(2.h),
              ).p(3.w).onTap(() {
                Get.to(() => Distortionbreakdown());
              }),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffc07c)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/latest.png',
                      scale: 3,
                    ),
                    1.h.heightBox,
                    Text('Catastrophizing ', style: text27),
                    1.h.heightBox,
                    const Text(
                        'Learning about “All or nothing” \nor Black and white thinking pattern')
                  ],
                ).p(2.h),
              ).p(3.w).onTap(() {
                Get.to(() => Distortionbreakdown());
              }),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffc07c)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mind reading', style: text27),
                    1.h.heightBox,
                    const Text(
                        'Learning about “All or nothing” \nor Black and white thinking pattern')
                  ],
                ).p(2.h),
              ).p(3.w),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffc07c)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' Fortune Telling', style: text27),
                    1.h.heightBox,
                    const Text(
                        'Learning about “All or nothing” \nor Black and white thinking pattern')
                  ],
                ).p(2.h),
              ).p(3.w),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffc07c)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Catastrophizing ', style: text27),
                    1.h.heightBox,
                    const Text(
                        'Learning about “All or nothing” \nor Black and white thinking pattern')
                  ],
                ).p(2.h),
              ).p(3.w),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffc07c)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mind reading', style: text27),
                    1.h.heightBox,
                    const Text(
                        'Learning about “All or nothing” \nor Black and white thinking pattern')
                  ],
                ).p(2.h),
              ).p(3.w),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffffc07c)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' Fortune Telling', style: text27),
                    1.h.heightBox,
                    const Text(
                        'Learning about “All or nothing” \nor Black and white thinking pattern')
                  ],
                ).p(2.h),
              ).p(3.w),
            ],
          ).p(3.w),
        ),
      ),
    );
  }
}
