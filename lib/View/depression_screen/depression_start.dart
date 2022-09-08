import 'package:archna_frontend/constant/contant.dart';
import 'package:archna_frontend/constant/depress_screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'depression_question/depression1_screen.dart';

class DepressionStart extends StatelessWidget {
  const DepressionStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DebackGroundColor(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  15.h.heightBox,
                  Image.asset('assets/images/depress.png'),
                  1.h.heightBox,
                  Text(
                    textAlign: TextAlign.center,
                    'Mentel health assessment \nfor depression',
                    style: text2,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.to(Depression()),
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
                ).centered().p(3.5.w),
              ),
            )
          ],
        ).p(3.h),
      ),
    );
  }
}
