import 'package:archna_frontend/View/story/test_your_understanding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/lesson.dart';
import 'package:archna_frontend/models/variables/service.dart';

class StoryPage extends StatefulWidget {
  StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}
  String lessonid = service
      .less.requiredLesson!.questions!.storyQuestions![service.num].sId
      .toString();
  String qid = service.less.requiredLesson!.sId.toString();
  
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

    return Lesson.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _StoryPageState extends State<StoryPage> {
  double data4 = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            top: 9.h,
            child: Image.asset(
              "assets/images/leaf.gif",
              height: 80.h,
              width: 100.w,
              fit: BoxFit.fill,
            ),
          ),
          Container(height: 200.h, width: 100.w, color: themAppcolor),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        roundedEdges: Radius.circular(10),
                      )),
                ],
              ),
              4.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.black)),
                  InkWell(
                      onTap: () {
                        service.step;
                        Get.to(
                          () => TestYourUnderStanding(),
                        );
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black)),
                ],
              ),
              4.h.heightBox,
              Text(
                "Evidance",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "${service.less.requiredLesson!.storyExplaination!.evidence}",
                style: text25,
              ),
              4.h.heightBox,
              Text(
                "Belief",
                style: text30,
              ),
              2.h.heightBox,
              Text(
                "${service.less.requiredLesson!.storyExplaination!.beleif}",
                style: text25,
              ),
              2.h.heightBox,
            ],
          ).pSymmetric(h: 2.h),
        ],
      ),
    ));
  }
}
