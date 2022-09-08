import 'package:archna_frontend/View/distortion/question/distortion_controller.dart';
import 'package:archna_frontend/View/distortion/question/distortion_option.dart';
import 'package:archna_frontend/View/model/distortion_model.dart';
import 'package:archna_frontend/View/understanding/understanding1_option.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constant/contant.dart';

class DistortionQuestion extends StatefulWidget {
  const DistortionQuestion({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final DistortionModel question;

  @override
  State<DistortionQuestion> createState() => _DistortionQuestionState();
}

class _DistortionQuestionState extends State<DistortionQuestion> {
  @override
  Widget build(BuildContext context) {
    // QuestionController _controller = Get.put(QuestionController());
    DistortionController distortionController = Get.put(DistortionController());

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
                (index) => DistortionOption(
                    index: index,
                    text: widget.question.options![index],
                    press: () {
                      setState(() {
                        distortionController.isvisible =
                            !distortionController.isvisible;
                      });
                      distortionController.checkAns(widget.question, index);
                    }),
              ),
              4.h.heightBox,
              Visibility(
                visible: distortionController.isvisible,
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
