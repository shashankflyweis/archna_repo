import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../model1/anxiety_model.dart';
import '../../anxiety/anxiety_screen_background.dart';
import 'anxiety1_option.dart';
import 'anxiety_controller.dart';

class AnxietyQuestion extends StatefulWidget {
  const AnxietyQuestion({
    Key? key,
    // it means we have to pass this
    required this.question1,
  }) : super(key: key);

  final AnxietyModel question1;

  @override
  State<AnxietyQuestion> createState() => _AnxietyQuestionState();
}

class _AnxietyQuestionState extends State<AnxietyQuestion> {
  AnxietyController anxietyController = Get.put(AnxietyController());
  @override
  Widget build(BuildContext context) {
    // QuestionController _controller = Get.put(QuestionController());

    return Scaffold(
      body: AnxietyBackground(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                right: 40,
                child: Center(
                  child: Container(
                    height: 50.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white60),
                  ),
                ),
              ),
              Positioned(
                  right: 35,
                  bottom: 40,
                  child: Center(
                    child: Container(
                      height: 72.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                    ),
                  )),
              Positioned(
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    height: 70.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                      child: Column(
                        children: [
                          Column(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.question1.title.toString()),
                                    Text(
                                      widget.question1.question.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    4.h.heightBox,
                                    ...List.generate(
                                      widget.question1.options!.length,
                                      (index) => AnxietyOption(
                                          index: index,
                                          text:
                                              widget.question1.options![index],
                                          press: () {
                                            setState(() {
                                              anxietyController.isvisible =
                                                  !anxietyController.isvisible;
                                            });
                                            anxietyController.checkAns(
                                                widget.question1, index);
                                          }),
                                    ),
                                    4.h.heightBox,
                                    Visibility(
                                      visible: anxietyController.isvisible,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 2.h),
                                        width: double.infinity,
                                        // color: themAppcolor,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text(
                                            //   "Answer",
                                            //   style: text29,
                                            // ),
                                            2.h.heightBox,
                                            // Text(
                                            //   widget.question.answershow.toString(),
                                            //   style: text25,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
