import 'package:archna_frontend/constant/contant.dart';
import 'package:archna_frontend/constant/depress_screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../model1/anxiety_model.dart';
import '../../model1/depression_model.dart';
import '../anxiety_screen/anxiety_question/anxiety_controller.dart';
import '../depression_screen/depression_question/depression_controller.dart';
import 'anxiety_screen_background.dart';

class AnxietyQuetsion extends StatelessWidget {
  AnxietyQuetsion ({Key? key, this.question}) : super(key: key);

  AnxietyModel? question;

  @override
  Widget build(BuildContext context) {
    AnxietyController anxietyController = Get.put(AnxietyController());

    return SafeArea(
      child: Scaffold(
        body: AnxietyBackground(
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  bottom: -20,
                  top: 22,
                  left: 90,
                  child: Center(
                    child: Container(
                      height: 80.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white38),
                    ),
                  ),
                ),
                Positioned(
                    top: 100,
                    // bottom: -8,
                    left: 50,
                    // top: -10,
                    child: Center(
                      child: Container(
                        height: 78.h,
                        width: 78.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white60),
                      ),
                    )),
                Positioned(
                    // bottom: ,

                    // bottom: ,
                    // top: -2,
                    child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    height: 76.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                      child: Obx(
                        () => Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                text:
                                    "Question ${anxietyController.questionNumber.value}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text:
                                        "/${anxietyController.questions2.length}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
