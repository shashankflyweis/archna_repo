import 'dart:ffi';

import 'package:archna_frontend/lesson/lesson1.dart';
import 'package:archna_frontend/models/progress.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Widgets/lesson_overview.dart';
import '../../constant/contant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/lesson.dart';
import 'package:archna_frontend/models/variables/service.dart';

class LessonBreakDown extends StatefulWidget {
  const LessonBreakDown({Key? key}) : super(key: key);

  @override
  State<LessonBreakDown> createState() => _LessonBreakDownState();
}

Future<Lesson> lesson() async {
  var response = await http.get(
      Uri.http("archana-metal-health.herokuapp.com",
          "api/lessons/${service.servid}"),
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = response.body;
  Lesson data1 =Lesson.fromJson(jsonDecode(response.body));
service.total=9+data1.requiredLesson!.questions!.practiceQuestions!.length.toInt()+data1.requiredLesson!.questions!.storyQuestions!.length.toInt()+data1.requiredLesson!.questions!.storyQuestions!.length.toInt();
  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);

    return Lesson.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

Future<progressmodel> progress() async {
  service.total = 0;
  service.step = 1;
  var response = await http.get(
      Uri.http("archana-metal-health.herokuapp.com",
          "api/progress/lessons/${service.servid}"),
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);

    return progressmodel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _LessonBreakDownState extends State<LessonBreakDown> {
  //  String par = 0.4.toString();

  double par = 0.2;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<progressmodel>(
      future: progress(),
      builder: (context, snapshot1) {
        if (!snapshot1.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: themAppcolor,
            ),
          );
        } else {
          return FutureBuilder<Lesson>(
              future: lesson(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: themAppcolor,
                    ),
                  );
                } else {
                  return Scaffold(
                      backgroundColor: themAppcolor,
                      appBar: AppBar(
                        elevation: 0.0,
                        backgroundColor: themAppcolor.withOpacity(0.01),
                        title: Text(
                          "${snapshot.data!.requiredLesson!.title}",
                          style: text29,
                        ),
                        leading: const Icon(Icons.arrow_back_ios_outlined,
                            color: Colors.black),
                      ),
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13.h,
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                1.h.heightBox,
                                Text(
                                  "${snapshot.data!.requiredLesson!.description}",
                                  style: text27,
                                ).pOnly(left: 9.h),
                                2.h.heightBox,
                                Row(
                                  children: [
                                    CircularPercentIndicator(
                                      animation: true,
                                      animationDuration: 10000,
                                      radius: 30,
                                      lineWidth: 5,
                                      percent: snapshot1.data!.percentCompleted!
                                              .toDouble() /
                                          100,
                                      progressColor: ratingcolor,
                                      backgroundColor: Colors.white,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      center: CircleAvatar(
                                        backgroundColor: wco,
                                        radius: 12,
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: bco,
                                        ),
                                      ),
                                    ).pOnly(left: 9.h),
                                    5.w.widthBox,
                                    Text(
                                      // par.toString() + "%",
                                      "${(snapshot1.data!.percentCompleted)} % complete",
                                      style: text28,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // constraints: const BoxConstraints(
                              //   maxHeight: double.infinity,
                              // ),
                              height: 76.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.sp),
                                      topLeft: Radius.circular(20.sp))),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    2.h.heightBox,
                                    Text(
                                      "Lesson overview",
                                      style: text29,
                                    ),
                                    2.h.heightBox,
                                    LessonOverview(
                                      img: "assets/images/Storyimg.png",
                                      title: "Story time",
                                      subtit:
                                          "Teaching mental health concepts with simple, relatable and interactive stories",
                                    ),
                                    2.h.heightBox,
                                    LessonOverview(
                                      img: "assets/images/testimg.png",
                                      title: "Test your understanding",
                                      subtit:
                                          "Test your understanding of concepts with simple quizzes",
                                    ),
                                    2.h.heightBox,
                                    LessonOverview(
                                      img: "assets/images/Summaryimg.png",
                                      title: "Story time",
                                      subtit:
                                          "Lesson summarized in 3 simple key takeaways",
                                    ),
                                    2.h.heightBox,
                                    LessonOverview(
                                      img: "assets/images/Exercisesimg.png",
                                      title: "Exercises",
                                      subtit:
                                          "Let’s deep dive into thoughts and feelings",
                                    ),
                                    2.h.heightBox,
                                    LessonOverview(
                                      img: "assets/images/Practiseimg.png",
                                      title: "Practise",
                                      subtit:
                                          "Practice your understanding of concepts of thoughts and feelings",
                                    ),
                                    4.h.heightBox,
                                    Container(
                                      height: 8.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                      child: Center(
                                        child: Text(
                                          "Start Lesson",
                                          style: text22,
                                        ),
                                      ),
                                    ).onTap(() {
                                      Get.to(() => Lesson1());
                                    }),
                                    4.h.heightBox,
                                  ],
                                ).pSymmetric(h: 2.h),
                              ),
                            ),
                          )
                        ],
                      ));
                }
              });
        }
      },
    );
  }
}
