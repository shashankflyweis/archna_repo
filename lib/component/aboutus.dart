import 'dart:async';

import 'package:archna_frontend/View/depression_screen/depression2.dart';
import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constant/contant.dart';
import 'package:archna_frontend/models/aboutusmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AboutUsPage extends StatefulWidget {
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

Future<Aboutus_model> aboutus() async {
  var response = await http.get(
    Uri.http("archana-metal-health.herokuapp.com", "api/about"),
  );
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);

    return Aboutus_model.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffC8F6B6),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back, size: 30).onTap(() {
                  Get.back();
                }),
                3.w.widthBox,
                Text('About Us', style: text4),
              ],
            ),
            1.h.heightBox,
            1.h.heightBox,
            FutureBuilder<Aboutus_model>(
                future: aboutus(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('${snapshot.data!.aboutUs}',
                        style: TextStyle(fontSize: 12.sp));
                  } else {
                    return CircularProgressIndicator();
                  }
                }))
          ],
        ).p(3.h),
      ),
    );
  }
}
