import 'package:archna_frontend/View/depression_screen/depression_question/depression_controller.dart';
import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';
import 'depression1.dart';
import 'depression_question/depression1_screen.dart';
import 'depression_start.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/updatedep_score.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:archna_frontend/models/variables/service.dart';

class Depressionfinalscore extends StatefulWidget {
  Depressionfinalscore({Key? key}) : super(key: key);

  @override
  State<Depressionfinalscore> createState() => _DepressionfinalscoreState();
}

String score = '15';

class _DepressionfinalscoreState extends State<Depressionfinalscore> {
  Future<Update_depscore> dep_score(String score) async {
    var response = await http.patch(
        Uri.http("archana-metal-health.herokuapp.com", "api/phq9-result"),
        body: {"result": score},
        headers: {'Authorization': 'Bearer ${service.token}'});
    var data = response.body;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('score', score);
    print(data);
    if (response.statusCode == 200) {
      String responseString = response.body;

      dataModelFromJson(responseString);
      print(response.body);

      return Update_depscore.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed");
    }
  }

  @override
  void initState() {
    super.initState();

    dep_score(score.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: depression,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                4.h.heightBox,
                Text(
                  textAlign: TextAlign.center,
                  'We measured your responses using a \nUniversal Test',
                  style: TextStyle(
                      color: Color(0xff826250),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ).centered(),
              ],
            ),
            Column(
              children: [
                Text('And your final score was', style: text4),
                Text.rich(TextSpan(children: [
                  TextSpan(text: '15', style: text4),
                  TextSpan(
                      text: '  out of 63',
                      style: TextStyle(
                          color: Color(0xff826250),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600))
                ]))
              ],
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.to(() => Depression(),
                      arguments: Get.delete<DepressionController>()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffcd997c),
                      border: Border.all(color: Color(0xffcd997c)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/refresh.png', scale: 3)
                            .centered(),
                        Text(
                          'Retake the test',
                          style: text4,
                        ).centered().p(3.5.w),
                      ],
                    ),
                  ).p(3.w),
                ),
                InkWell(
                  onTap: () => Get.to(Depression1()),
                  //
                  child: Container(
                    decoration: BoxDecoration(
                      color: btnblack,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'What does this mean?',
                      style: text8,
                    ).centered().p(3.5.w),
                  ).p(3.w),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
