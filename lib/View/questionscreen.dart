import 'package:archna_frontend/View/story/story_page.dart';
import 'package:archna_frontend/models/answermodel.dart';
import 'package:archna_frontend/models/lessupmodel.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:archna_frontend/models/variables/service.dart';
import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:archna_frontend/models/variables/service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

String lessonid = service
    .less.requiredLesson!.questions!.storyQuestions![service.num].sId
    .toString();
String qid = service.less.requiredLesson!.sId.toString();
Future<answermodel> answer(String lid, String qid, String ans) async {
  var response = await http.post(
      Uri.http("archana-metal-health.herokuapp.com", "api/answers/lessons"),
      body: {"lessonId": lid, "lessonQuestionId": qid, "answer": ans},
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);

    return answermodel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

Future<lessupmodel> update(String lid, String precent) async {
  var response = await http.patch(
      Uri.http("archana-metal-health.herokuapp.com", "api/progress/lessons/update"),
      body: {"lessonId": lid, "percentCompleted": precent},
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);

    return lessupmodel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? tappedIndex;
  @override
  void initState() {
    super.initState();
    tappedIndex = 8;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themAppcolor,
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
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
                      Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                      InkWell(
                          onTap: () {
                            if (service.num ==
                                (service.less.requiredLesson!.questions!
                                        .storyQuestions!.length
                                        .toInt()) -
                                    1) {
                              service.step++;
                              Get.to(() => StoryPage());
                            } else {
                              service.step++;
                              service.num++;
                              print(service.num);
                              print(service.less.requiredLesson!.questions!
                                  .practiceQuestions!.length
                                  .toInt());
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          super.widget));
                            }
                            ;
                          },
                          child: Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.black)),
                    ],
                  ),
                  2.h.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text.rich(
                      TextSpan(
                        text: "Question ${service.num + 1}",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "/${service.less.requiredLesson!.questions!.storyQuestions!.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  4.h.heightBox,
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: Column(
                          children: [
                            Text(
                              service.question[service.num].toString(),
                              style: text30,
                            ),
                            4.h.heightBox,
                            SizedBox(
                              child: service.options.isEmpty
                                  ? Container(
                                      height: 15.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                      child: TextFormField(
                                        maxLines: 10,
                                        decoration: const InputDecoration(
                                            hintText: "Write your answer here",
                                            border: InputBorder.none),
                                      ).p12(),
                                    )
                                  : ListView.builder(
                                      itemCount: service
                                          .options[service.num].length
                                          .toInt(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            OutlinedButton(
                                              onPressed: () => setState(() {
                                                tappedIndex = index;
                                                answer(
                                                    lessonid,
                                                    qid,
                                                    service.options[service.num]
                                                        [index]);
                                                update(qid, '${((service.step/
                                                    service.total)*100).toInt()}');
                                              }),
                                              child: Text(
                                                  service.options[service.num]
                                                      [index],
                                                  style: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                  )),
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                )),
                                                side: MaterialStateProperty.all(
                                                    BorderSide(
                                                        width: 2.0,
                                                        color: Colors.black)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  tappedIndex == index
                                                      ? Colors.green
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                            2.h.heightBox
                                          ],
                                        );
                                      }),
                            ),
                            4.h.heightBox
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
