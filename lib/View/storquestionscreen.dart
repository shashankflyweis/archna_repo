import 'package:archna_frontend/View/distortion/score2.dart';
import 'package:archna_frontend/View/lessonsummery/lesson_summary.dart';
import 'package:archna_frontend/View/story/story_page.dart';
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
import 'package:archna_frontend/models/answermodel.dart';
import 'package:archna_frontend/models/lessupmodel.dart';
import 'package:archna_frontend/models/storupmodel.dart';

class StorquestionScreen extends StatefulWidget {
  const StorquestionScreen({Key? key}) : super(key: key);

  @override
  State<StorquestionScreen> createState() => _StorquestionScreenState();
}
String storeid = service.store.story!.questions![service.num].sId
    .toString();
String qid = service.store.story!.questions![service.num].schoolTimeStory.toString();
 TextEditingController answers = TextEditingController();
Future<answermodel> answer(String lid, String qid, String ans) async {
  var response = await http.post(
      Uri.http("archana-metal-health.herokuapp.com", "api/answers/school-time-stories"),
      body: {"schoolStoryId": lid, "schoolStoryQuestionId": qid, "answer": ans},
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

Future<storeupmodel> update(String lid, String precent) async {
  var response = await http.patch(
      Uri.http("archana-metal-health.herokuapp.com", "api/progress/school-time-story/update"),
      body: {"schoolStoryId": lid, "percentCompleted": precent},
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);


    return storeupmodel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}


class _StorquestionScreenState extends State<StorquestionScreen> {
  int? tappedIndex;
  String lessonid = service.store.story!.questions![service.num].sId.toString();
  String qid = service.store.story!.questions![service.num].schoolTimeStory.toString();
  @override
  void initState() {
    super.initState();
    tappedIndex = 8;
  }

  @override
  Widget build(BuildContext context) {
    // .where(
    //     (k) => service.options[service.num].indices.isEmpty) // filter keys
    // .toList() // create a copy to avoid concurrent modifications
    // .forEach(service.options[service.num].remove);
    return Scaffold(
        backgroundColor: themAppcolor,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
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
                       
                      ],
                    ),
                    4.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                        InkWell(
                            onTap: () {
                              service.step++;
                              if (service.num ==
                                  (service.store.story!.questions!.length
                                          .toInt() -
                                      1)) {
                                Get.to(() => Score2());
                              } else {
                                service.num++;
                                print(service.num);
                                print(service.store.story!.questions!.length
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
                                  "/${service.store.story!.questions!.length}",
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
                                child: service.options[service.num].length==0
                                    ?Column(
                                        children: [
                                          Container(
                                              height: 50.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(15.sp)),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller: answers,
                                                    maxLines: 10,
                                                    decoration: const InputDecoration(
                                                        hintText:
                                                            "Write your answer here",
                                                        border: InputBorder.none),
                                                  ).p12(),
                                                  
                                                ],
                                              ),
                                              
                                            ),
                                            1.h.heightBox,
                                            SizedBox(
                                              width: 25.w,
                                              height: 10.w,
                                              child: RaisedButton(onPressed: () {answer(
                                                            lessonid,
                                                            qid,
                                                            answers.text.toString());
                                                        update(qid, '${(((service.num+1)/
                                                      service.store.story!.questions!.length)*100).toInt()}');  },child: Text('SUBMIT',style:TextStyle(color: white1),),color: Colors.black,),
                                            ),
                                        ],
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
                                                  update(qid, '${((service.num/
                                                      service.store.story!.questions!.length)*100).toInt()}');
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
          ),
        ));
  }
}
