import 'package:archna_frontend/View/model/understanding_model.dart';
import 'package:archna_frontend/View/understanding/understanding1_option.dart';
import 'package:archna_frontend/View/understanding/understanding_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../component/option.dart';
import '../../constant/contant.dart';


class UnderStandingQuestion extends StatefulWidget {
  const UnderStandingQuestion({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final UnderStandingModel1 question;

  @override
  State<UnderStandingQuestion> createState() => _UnderStandingQuestionState();
}

class _UnderStandingQuestionState extends State<UnderStandingQuestion> {
  @override
  Widget build(BuildContext context) {
    // QuestionController _controller = Get.put(QuestionController());
    UnderStandingController underStandingController =
        Get.put(UnderStandingController());

    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Column(
            children: [
              Text(widget.question.question.toString(), style: text30),
              4.h.heightBox,
              ...List.generate(
                widget.question.options!.length,
                (index) => UnderStandingOption(
                    index: index,
                    text: widget.question.options![index],
                    press: () {
                      setState(() {
                        underStandingController.isvisible =
                            !underStandingController.isvisible;
                      });
                      underStandingController.checkAns(widget.question, index);
                    }),
              ),
              4.h.heightBox,
              Visibility(
                visible: underStandingController.isvisible,
                child: Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  width: double.infinity,
                  // color: themAppcolor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Answer",
                        style: text30,
                      ),
                      2.h.heightBox,
                      Text(
                        widget.question.answershow.toString(),
                        style: text25,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
