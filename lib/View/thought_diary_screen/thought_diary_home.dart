import 'package:archna_frontend/View/lesson_break_down/lesson_break_down_page.dart';
import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Thoughtdiary extends GetView<Thoughtdiary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  height: 15.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: circleContainer,
                      border: Border.all(color: Colors.transparent)),
                  child: Image.asset(
                    'assets/images/lock.png',
                    scale: 3,
                  ),
                ),
                2.h.heightBox,
                Text(
                  '''Thought diary will only be available
after completing lessons 1 and 2 ''',
                  style: text3,
                  // maxLines: 2,
                ).centered(),
              ],
            ),
            15.heightBox,
            // Container(
            //   decoration: BoxDecoration(
            //     color: btnblack,
            //     border: Border.all(color: Colors.black),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Text(
            //     'Go back to lessons',
            //     style: text8,
            //   ).centered().p(3.5.w),
            // ).p(3.w).onTap(() {
            //   Get.to(() => LessonBreakDown());
            // }),
          ],
        ),
      ),
    );
  }
}
