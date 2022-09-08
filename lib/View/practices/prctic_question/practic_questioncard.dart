import 'package:archna_frontend/View/practices/prctic_question/practic_controller.dart';
import 'package:archna_frontend/View/practices/prctic_question/practic_option.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constant/contant.dart';
import '../../model/practic_question_model.dart';

class PracticQuestion extends StatefulWidget {
  const PracticQuestion({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final PracticQuestionModel question;

  @override
  State<PracticQuestion> createState() => _PracticQuestionState();
}

class _PracticQuestionState extends State<PracticQuestion> {
  @override
  Widget build(BuildContext context) {
    // QuestionController _controller = Get.put(QuestionController());
    PracticController practicController = Get.put(PracticController());
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
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
                (index) => PracticOptin(
                    index: index,
                    text: widget.question.options![index],
                    press: () {
                      setState(() {
                        practicController.isvisible =
                            !practicController.isvisible;
                      });
                      practicController.checkAns(widget.question, index);
                    }),
              ),
              4.h.heightBox,
              Visibility(
                visible: practicController.isvisible,
                child: Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  width: double.infinity,
                  // color: themAppcolor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Answer",
                        style: text29,
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
