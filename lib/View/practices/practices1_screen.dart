import 'package:archna_frontend/View/practices/prctic_question/practic_question_main.dart';
import 'package:archna_frontend/View/questionscreen2.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/lesson.dart';
import 'package:archna_frontend/models/variables/service.dart';
import 'package:archna_frontend/View/model/story_model_question.dart';
import 'package:archna_frontend/models/variables/service.dart';
import '../../constant/contant.dart';

class Practices1 extends StatefulWidget {
  Practices1({Key? key}) : super(key: key);

  @override
  State<Practices1> createState() => _Practices1State();
}

void addDataToListoption(List<String> data) {
  service.options.add(data);
}

void addtoquestion(String data) {
  service.question.add(data);
}

void addtoid(String data) {
  service.id.add(data);
}

void addtolid(String data) {
  service.lid.add(data);
}

void addtoans(String data) {
  service.answer.add(data);
}

Future<Lesson> lesson() async {
  var response = await http.get(
      Uri.http("archana-metal-health.herokuapp.com",
          "api/lessons/${service.servid}"),
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);
    service.less = Lesson.fromJson(jsonDecode(response.body));
    service.range =
        service.less.requiredLesson!.questions!.practiceQuestions!.length;
    int? n = service.less.requiredLesson!.questions!.practiceQuestions?.length
        .toInt();
    service.num = 0;
    service.answer.clear();
    service.options.clear();
    service.question.clear();
    service.id.clear();
    service.lid.clear();
    for (int i = 0; i < n!; i++) {
      addDataToListoption(service
          .less.requiredLesson!.questions!.practiceQuestions![i].options!);
      addtoquestion(service
          .less.requiredLesson!.questions!.practiceQuestions![i].question
          .toString());

      addtoid(service.less.requiredLesson!.questions!.practiceQuestions![i].sId
          .toString());
      addtolid(service.less.requiredLesson!.questions!.practiceQuestions![i].sId
          .toString());
      addtoans(service.less.requiredLesson!.questions!.practiceQuestions![i].sId
          .toString());
    }
    ;

    print(service.question);
    print(service.answer);

    return Lesson.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _Practices1State extends State<Practices1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Lesson>(
        future: lesson(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              color: themAppcolor,
            ));
          } else {
            return Scaffold(
              backgroundColor: themAppcolor,
              body: Stack(
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    // color: Colors.red,
                  ).pSymmetric(h: 2.h),
                  Positioned(
                      top: 15.h,
                      left: -22.h,
                      right: -22.h,
                      child: Lottie.asset(
                        "assets/images/wave3.json",
                        width: 100.w,
                        fit: BoxFit.fill,
                      )),
                  Column(
                    children: [
                      6.h.heightBox,
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/canimg.png",
                          ),
                          3.w.widthBox,
                          Container(
                            width: 84.w,
                            child: StepProgressIndicator(
                              totalSteps: service.total,
                              currentStep: service.step,
                              size: 8,
                              padding: 0,
                              selectedColor: Colors.black,
                              unselectedColor: Colors.grey,
                              roundedEdges: const Radius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      3.h.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                service.step++;
                                Get.to(() => QuestionScreen2(), arguments: 60);
                              },
                              child: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.black))
                        ],
                      ),
                      10.h.heightBox,
                      Container(
                        height: 20.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: const Color(0xff9EB9A0),
                            borderRadius: BorderRadius.circular(60.sp)),
                        child: Center(
                          child: Image.asset(
                            "assets/images/preimg.png",
                            height: 8.h,
                            width: 16.w,
                          ),
                        ),
                      ),
                      2.h.heightBox,
                      Text(
                        "Practise",
                        style: text30,
                      ),
                      2.h.heightBox,
                      Text(
                        "Practice your understanding of concepts of thoughts and feelings",
                        textAlign: TextAlign.center,
                        style: text25,
                      ),
                    ],
                  ).pSymmetric(h: 2.h)
                ],
              ),
            );
          }
        });
  }
}
