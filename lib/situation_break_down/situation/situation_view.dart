import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant1.dart';
import '../../distortion/distortion_break_down/distortion_break_down.dart';
import 'package:archna_frontend/models/situationmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/variables/service.dart';

class SituationView extends StatefulWidget {
  SituationView({Key? key}) : super(key: key);

  @override
  State<SituationView> createState() => _SituationViewState();
}

List<situation_model> situationList = [];
Future<List<situation_model>> situation() async {
  final response = await http.get(
      Uri.parse('https://archana-metal-health.herokuapp.com/api/situations'),
      headers: {'Authorization': 'Bearer ${service.token}'});
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      print(i['title']);
      situationList.add(situation_model.fromJson(i));
    }
    return situationList;
  } else {
    return situationList;
  }
}

class _SituationViewState extends State<SituationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 89, 54, 54),
        title: Text("Situations", style: text27),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: situation(),
                builder:
                    (context, AsyncSnapshot<List<situation_model>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: situationList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 90.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffffc07c)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                index == 0 || index == 1
                                    ? Image.asset(
                                        'assets/images/latest.png',
                                        scale: 3,
                                      )
                                    : Text(''),
                                1.h.heightBox,
                                Text(
                                    '${snapshot.data![index].distortionId!.title}',
                                    style: text20)
                              ],
                            ).p(2.h),
                          ).p(3.w).onTap(() {
                            Get.to(() => Distortionbreakdown());
                          });
                        });
                  }
                }),
          ),
        ],
      ).p(3.w),
    );
  }
}
