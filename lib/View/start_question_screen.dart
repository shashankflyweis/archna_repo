import 'package:archna_frontend/View/Home_screen.dart';
import 'package:archna_frontend/View/depression_screen/depression_start.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/bottom_nav.dart';

class StartQuestionScreen extends StatelessWidget {
  const StartQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundColor(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'we are ask you for a few question ',
              style: text4,
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () => Get.to(() => Bottom2()),
              child: Container(
                height: 9.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(5, 6, 6, 0.2)),
                child: Center(
                  child: Text(
                    'Skip these questions',
                    style: text2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () => Get.to(DepressionStart()),
              child: Container(
                height: 9.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Okey',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
