import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:sizer/sizer.dart';

import '../../../constant/color.dart';
import 'anxiety_controller.dart';

class AnxietyOption extends StatelessWidget {
  const AnxietyOption({
    Key? key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);
  final String? text;
  final int? index;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnxietyController>(
        init: AnxietyController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Color(0xff59BA26);
              }
              // else if (index == qnController.selectedAns &&
              //     qnController.selectedAns != qnController.correctAns) {
              //   return worng;
              // }
            }
            return Colors.white;
          }

          // IconData getTheRightIcon() {
          //   return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          // }

          return InkWell(
            onTap: press,
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: double.infinity,
              ),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: getTheRightColor(),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                width: 80.w,
                child: Text(
                  " $text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: index == qnController.correctAns
                          ? Colors.white
                          : Colors.black,
                      fontSize: 13.sp),
                ),
              ),
            ),
          );
        });
  }
}
