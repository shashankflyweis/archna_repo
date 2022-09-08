import 'package:archna_frontend/View/thank_screen.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:archna_frontend/models/hapinessmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/variables/service.dart';
class FeelingScreen extends StatefulWidget {
  const FeelingScreen({Key? key}) : super(key: key);

  @override
  State<FeelingScreen> createState() => _FeelingScreenState();
}

Future<happiness_model> happy(String mood) async {
  var response = await http.patch(
      Uri.http("archana-metal-health.herokuapp.com", "api/diary/add-feelings"),
      body: {"feeling": mood},
      headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjMxODc5MTFmYmNhZDE2ZWYwY2Q1MDYyIiwiaWF0IjoxNjYyNTQ4MjQxLCJleHAiOjE2NjM4NDQyNDF9.bmt810etvVRCQ0H_ZozdY6NeoAMqJ7jZuVJJs_H6uFg'});
  var data = response.body;

  print(data);
  if (response.statusCode == 200) {
    String responseString = response.body;

    dataModelFromJson(responseString);
    print(response.body);
    Get.to(ThankYouScreen(),
        transition: Transition.fadeIn, duration: const Duration(seconds: 2));
    return happiness_model.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed");
  }
}

class _FeelingScreenState extends State<FeelingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColor(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    height: 30.h,
                    // width: 70.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/images/feel.png',
                      ),
                    )),
                  ),
                  const Center(
                    child: Text(
                      'How are you feeling today?',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  InkWell(
                    onTap: () => happy('I am Happy'),
                    child: Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.white),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'I am happy',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/images/smile.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => happy('Just okey'),
                    child: Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.white),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Just okey',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/images/smile.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => happy('Been Better'),
                    child: Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.white),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'I am happy',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/images/smile.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => happy('Really Down'),
                    child: Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.white),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Really Down',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/images/smile.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => happy('I am not okey'),
                    child: Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.white),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'I am not okey',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/images/smile.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
