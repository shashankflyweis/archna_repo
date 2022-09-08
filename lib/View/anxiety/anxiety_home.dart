import 'package:archna_frontend/View/anxiety_screen/anxiety_question/anxiety1_screen.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:archna_frontend/constant/depress_screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/color.dart';

class AnxietyHome extends StatelessWidget {
  const AnxietyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: anxiety,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  15.h.heightBox,
                  Image.asset('assets/images/Anxiety.png', scale: 4),
                  1.h.heightBox,
                  Text(
                    textAlign: TextAlign.center,
                    'Mental health assessment \nfor anxiety',
                    style: text2,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.to(AnxietyScreen()),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black),
                child: Text(
                  'start assessment',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ).centered().p(2.5.h),
              ),
            )
          ],
        ).p(3.h),
      ),
    );
  }
}
