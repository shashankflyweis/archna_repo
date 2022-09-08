import 'package:archna_frontend/View/model/story_model_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/contant.dart';
import '../controller/question_controller.dart';

import 'option.dart';
import 'package:archna_frontend/models/lesson.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
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
              Text(
                question.question.toString(),
                style: text30,
              ),
              4.h.heightBox,
              ...List.generate(
                question.options!.length,
                (index) => Option(
                  index: index,
                  text: question.options![index],
                  press: () => _controller.checkAns(question, index),
                ),
              ),
              4.h.heightBox
            ],
          ),
        ),
      ],
    );
  }
}
