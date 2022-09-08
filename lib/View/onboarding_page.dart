import 'package:archna_frontend/View/privacy_screen.dart';
import 'package:archna_frontend/View/signin_screen.dart';
import 'package:archna_frontend/View/signup_screen.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:archna_frontend/models/startjmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

Future<Startj_model> start() async {
  var response = await http.get(
    Uri.http("archana-metal-health.herokuapp.com", "api/startJourney"),
  );
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);

    return Startj_model.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();

    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColor(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<Startj_model>(
                  future: start(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data!.data!.heading1}',
                                  style: text3,
                                ),
                                1.5.h.heightBox,
                                Text(
                                  '${snapshot.data!.data!.content1}',
                                  style: text2,
                                ),
                                5.h.heightBox,
                                Text(
                                  '${snapshot.data!.data!.heading2}',
                                  style: text3,
                                ),
                                1.5.h.heightBox,
                                Text(
                                  '${snapshot.data!.data!.content2}',
                                  style: text2,
                                ),
                              ],
                            );
                         
                    }
                  }),
              InkWell(
                onTap: () => Get.to(
                  PrivacyScreen(),
                  transition: Transition.fadeIn,
                  duration: Duration(seconds: 3),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.black),
                  child: Text(
                    'Lets start this journey together!',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ).p(2.h).centered(),
                ),
              )
            ],
          ).p(4.w),
        ),
      ),
    );
  }
}
