import 'package:archna_frontend/View/Home/school_time_question/school_time_question.dart';
import 'package:archna_frontend/View/storquestionscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';
import 'dart:ffi';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/storiesmodel.dart';
import 'package:archna_frontend/models/variables/service.dart';
import 'package:archna_frontend/View/model/story_model_question.dart';
import 'package:archna_frontend/models/variables/service.dart';

class SchoolTimeStory extends StatefulWidget {
  SchoolTimeStory({Key? key}) : super(key: key);

  @override
  State<SchoolTimeStory> createState() => _SchoolTimeStoryState();
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

void addsummary(String data) {
  service.summary.add(data);
}

Future<storiesmodel> lesson() async {
  var response = await http.get(
      Uri.http("archana-metal-health.herokuapp.com",
          "api/school-time-stories/62f09f765d7a824c5fadf599"),
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);
    service.store = storiesmodel.fromJson(jsonDecode(response.body));

    int? n = service.store.story?.questions?.length;
    service.answer.clear();
    service.options.clear();
    service.question.clear();
    service.id.clear();
    service.lid.clear();

    print(service.store.story!.story);

    for (int i = 0; i < n!; i++) {
      addDataToListoption(service.store.story!.questions![i].options!.toList());
      addtoquestion(service.store.story!.questions![i].question.toString());
      service.num = 0;
      addtoid(service.store.story!.questions![i].sId.toString());
      addtolid(service.store.story!.questions![i].schoolTimeStory.toString());
    }
    ;
    print(service.options);
    print(service.options[0]);
    return storiesmodel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _SchoolTimeStoryState extends State<SchoolTimeStory> {
  // int data2 = Get.arguments;

  AudioPlayer audioplayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<storiesmodel>(
        future: lesson(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              color: themAppcolor,
            ));
          } else {
            return Scaffold(
              // appBar: AppBar(
              //   elevation: 0,
              //   backgroundColor: themAppcolor,
              //   leading: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
              //   actions: [
              //     InkWell(
              //         onTap: () {
              //           Get.to(() => SchoolTimeQuestion);
              //         },
              //         child: Icon(Icons.arrow_forward_ios, color: Colors.black)
              //             .pSymmetric(h: 2.h)),
              //   ],
              // ),
              body: Stack(
                children: [
                  1.h.heightBox,
                  Positioned(
                    top: 6.h,
                    child: Image.asset(
                      "assets/images/leaf.gif",
                      height: 80.h,
                      width: 100.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(height: 100.h, width: 100.w, color: themAppcolor),
                  Positioned(
                    top: 8.h,
                    child: Image.asset(
                      "assets/images/asleep.png",
                      height: 50.h,
                      width: 100.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 58.h,
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      width: 100.w,
                      child: Text(
                        "${snapshot.data!.story!.story}",
                        style: text25,
                      ).pSymmetric(h: 2.h),
                    ),
                  ),
                  Positioned(
                      top: 80.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Container(
                          width: 40.h,
                          height: 15.h,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(width: 40.h, child: slider()),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, right: 20.w),
                                  child: Row(children: [
                                    IconButton(
                                      onPressed: () => replay(),
                                      icon: Icon(Icons.replay_10_rounded),
                                      iconSize: 40,
                                    ),
                                    InkWell(
                                      child: Icon(
                                        playing == false
                                            ? Icons.play_circle_outline
                                            : Icons.pause_circle_outline,
                                        size: 60,
                                        color: Colors.black,
                                      ),
                                      onTap: () async {
                                        var url =
                                            "https://archana-metal-health.herokuapp.com/${snapshot.data!.story!.media}";

                                        if (playing) {
                                          var res = await audioplayer.pause();
                                          if (res == 1) {
                                            setState(() {
                                              playing = false;
                                            });
                                          }
                                        } else {
                                          var res = await audioplayer.play(url,
                                              isLocal: true);
                                          if (res == 1) {
                                            setState(() {
                                              playing = true;
                                            });
                                          }
                                        }
                                        audioplayer.onDurationChanged
                                            .listen((Duration dd) {
                                          setState(() {
                                            duration = dd;
                                          });
                                        });
                                        audioplayer.onAudioPositionChanged
                                            .listen((Duration dd) {
                                          setState(() {
                                            position = dd;
                                          });
                                        });
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () => forward(),
                                      icon: Icon(Icons.forward_10_rounded),
                                      iconSize: 40,
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      //   Image.asset(
                      //   "assets/images/musicimg.png",
                      //  height: 15.h,
                      //    width: 92.w,
                      //   fit: BoxFit.fill,
                      //  ).pSymmetric(h: 2.h),
                      ),
                  Column(
                    children: [
                      6.h.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(() => SchoolTimeQuestion());
                              },
                              child: const Icon(Icons.arrow_back_ios,
                                  color: Colors.black)),
                          InkWell(
                              onTap: () {
                                Get.to(() => StorquestionScreen());
                              },
                              child: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.black))
                        ],
                      ),
                    ],
                  ).pSymmetric(h: 2.h),
                ],
              ),
            );
          }
        });
  }

  Widget slider() {
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioplayer.seek(new Duration(seconds: value.toInt()));
        });
      },
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
    );
  }

  Future<void> replay() async {
    await audioplayer.seek(Duration(seconds: 5));
  }

  Future<void> forward() async {
    await audioplayer.seek(Duration(seconds: 5));
  }

  Future<void> getAudio() async {
    var url = "";

    if (playing) {
      var res = await audioplayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioplayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
    audioplayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioplayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
