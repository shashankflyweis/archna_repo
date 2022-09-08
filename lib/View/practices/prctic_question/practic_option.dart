import 'package:archna_frontend/View/practices/prctic_question/practic_controller.dart';
import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

class PracticOptin extends StatelessWidget {
  const PracticOptin({
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
    return GetBuilder<PracticController>(
        init: PracticController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return const Color(0xff59BA26);
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
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
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
                        fontWeight: FontWeight.w400,
                        color: index == qnController.correctAns
                            ? Colors.white
                            : Colors.black,
                        fontSize: 12.sp)),
              ),
            ),
          );
        });
  }
}
