import 'package:archna_frontend/View/signin_screen.dart';
import 'package:archna_frontend/View/signup_screen.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:archna_frontend/models/privacymodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrivacyScreen extends StatefulWidget {
  PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}
Future<privacy_model> privacy() async {
  var response = await http.get(
    Uri.http("archana-metal-health.herokuapp.com", "api/privacy-policy"),
  );
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);

    return privacy_model.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}
class _PrivacyScreenState extends State<PrivacyScreen> {
  RxBool isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundColor(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               FutureBuilder<privacy_model>(
    future: privacy(),
    builder:(context, snapshot) {
        if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
         } else {
            return Column(
              children: [
                Text(
                      '${snapshot.data!.data!.heading}',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                     SizedBox(
                  height: 4.h,
                ),
                Text(
                  '${snapshot.data!.data!.content}',
                  style: TextStyle(
                      height: 1.7,
                      // letterSpacing: 3.0,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 6.h,
                ),
              ],
            );
               
         }
     }
),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                          value: isChecked.value,
                          fillColor: MaterialStateProperty.all(Colors.black),
                          // checkColor: Colors.black,
                          onChanged: (bool? value) {
                            isChecked.toggle();
                            if (value == true) {
                              Get.to(() => SignUpScreen());
                            }
                          }),
                    ),
                    Text(
                      'I agree with privacy policy',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
