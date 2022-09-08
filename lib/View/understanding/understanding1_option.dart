import 'package:archna_frontend/View/understanding/understanding_controller.dart';
import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

class UnderStandingOption extends StatelessWidget {
  const UnderStandingOption({
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
    return GetBuilder<UnderStandingController>(
        init: UnderStandingController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Color(0xff59BA26);
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return worng;
              }
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
                child: Text(" $text",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      color: index == qnController.correctAns
                          ? Colors.white
                          : Colors.black,
                      fontSize: 12.sp,
                    )),
              ),
            ),
          );
        });
  }
}
