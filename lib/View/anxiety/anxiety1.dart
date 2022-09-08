import 'dart:async';

import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';
import 'anxiety2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/whatanxmean.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:archna_frontend/models/variables/service.dart';

class Anxiety1 extends StatefulWidget {
  @override
  State<Anxiety1> createState() => _Anxiety1State();
}

String score = '';
Future<void> getscore() async {}
late What_anxmean _whatanxmodel;

class _Anxiety1State extends State<Anxiety1> {
  Future<What_anxmean> what_mean(String score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    score = prefs.getString('score').toString();
    var response = await http.post(
        Uri.http("archana-metal-health.herokuapp.com",
            "api/what-score-means/gad7-result"),
        body: {"result": score},
        headers: {'Authorization': 'Bearer ${service.token}'});
    var data = response.body;

    print(data);
    if (response.statusCode == 200) {
      String responseString = response.body;

      dataModelFromJson(responseString);
      print(response.body);
      _whatanxmodel = What_anxmean.fromJson(jsonDecode(response.body));
      service.anxiety_problem = _whatanxmodel.anxietySeverity.toString();

      prefs.setString(
          'AnxietySeverity', _whatanxmodel.anxietySeverity.toString());

      return What_anxmean.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed");
    }
  }

  void initState() {
    super.initState();
    what_mean(score);
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Anxiety2())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: anxiety,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('And your final score was', style: text4),
            1.h.heightBox,
            Text.rich(TextSpan(children: [
              TextSpan(text: '15', style: text4),
              TextSpan(
                  text: '  out of 63',
                  style: TextStyle(
                      color: Color(0xff827850),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600))
            ])),
            1.h.heightBox,
            Column(
              children: [
                Text(
                    '''Explainer Text for explaining the scoring of this test. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu quam sed orci eleifend fermentum. Integer lobortis convallis tortor, eu congue elit ultrices sit amet. Nulla tempus turpis eu mauris porttitor, eu posuere libero sodales. Aenean euismod erat eget commodo porta. Vestibulum risus ante, porttitor imperdiet lorem vel, commodo pulvinar arcu. Nulla pharetra euismod metus, ac sollicitudin arcu auctor in. Cras convallis iaculis luctus. Etiam eu elit ac quam sollicitudin feugiat in vitae lectus. Duis nec ullamcorper neque. Fusce vestibulum justo sed erat vehicula, sed eleifend ipsum elementum.
            
            ''',
                    style: TextStyle(fontSize: 12.sp)),
              ],
            )
          ],
        ).p(3.h),
      ),
    );
  }
}
