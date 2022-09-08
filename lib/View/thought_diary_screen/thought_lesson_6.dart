import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class ThoughtLesson6 extends StatefulWidget {
  @override
  State<ThoughtLesson6> createState() => _ThoughtLesson6State();
}

class _ThoughtLesson6State extends State<ThoughtLesson6> {
  SingingCharacter? _character = SingingCharacter.Helpful;
  @override
  Widget build(BuildContext context) {
    // var data = 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: background,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Thought diary', style: text3),
        2.5.h.heightBox,
        Text(
          '''Let’s look at an example thought
diary entry.''',
          style: text9,
        ),
        2.h.heightBox,
        Container(
          height: MediaQuery.of(context).size.height * 0.79,
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Text('Date', style: text2),
                0.5.h.heightBox,
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      // fillColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      hintText: '26/06/2022',
                      hintStyle: text6),
                ),
                2.h.heightBox,
                Text('Situation', style: text2),
                0.5.h.heightBox,
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      // fillColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      hintText:
                          'My teacher scolded me for not finishing my assignment today.',
                      hintStyle: text6,
                      hintMaxLines: 2),
                ),
                2.h.heightBox,
                Text('Thoughts', style: text2),
                0.5.h.heightBox,
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      // fillColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      hintText: 'She may be thinking I am a bad student',
                      hintStyle: text6,
                      hintMaxLines: 2),
                ),
                2.h.heightBox,
                Text('Thoughts', style: text2),
                0.5.h.heightBox,
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.black)),
                      child: const Text('Anxious').p(2.w),
                    ),
                    3.w.widthBox,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.black)),
                      child: const Text('Unhappy').p(2.w),
                    ),
                  ],
                ),
                2.h.heightBox,
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    // fillColor: Colors.white,
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black)),
                      child: Text('Add', style: text8)
                          .pOnly(right: 5.w, left: 5.w, top: 1.5.h),
                    ).pOnly(right: 2.h),
                    hintText: 'Stre',
                    hintStyle: text6,
                  ),
                ),
                2.h.heightBox,
                Text('Behaviors', style: text2),
                0.5.h.heightBox,
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      // fillColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      hintText:
                          '''I quietly walk out of the class without     talking to anyone.''',
                      hintStyle: text6,
                      hintMaxLines: 2),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Are the thoughts helpful?', style: text2),
                    1.5.h.heightBox,
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 1, color: const Color(0xff4f574a)),
                            ),
                            child: Row(
                              children: [
                                Radio<SingingCharacter>(
                                  activeColor: const Color(0xff4f574a),
                                  value: SingingCharacter.Helpful,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                                const Text('Helpful',
                                    style: const TextStyle(
                                        color: const Color(0xff4f574a),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ],
                            ).pOnly(right: 3.w)),
                        2.h.widthBox,
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Radio<SingingCharacter>(
                                  activeColor: const Color(0xff4f574a),
                                  value: SingingCharacter.Unhelpful,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                                const Text('Unhelpful',
                                    style: const TextStyle(
                                        color: const Color(0xff4f574a),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ],
                            ).pOnly(right: 3.w)),
                      ],
                    )
                  ],
                ).p(3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Are the thoughts helpful?', style: text2),
                    1.5.h.heightBox,
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1, color: const Color(0xff4f574a)),
                            ),
                            child: Row(
                              children: [
                                Radio<SingingCharacter>(
                                  activeColor: const Color(0xff4f574a),
                                  value: SingingCharacter.Helpful,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                                const Text('Wholesome',
                                    style: const TextStyle(
                                        color: Color(0xff4f574a),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ],
                            ).pOnly(right: 2.w)),
                        2.h.widthBox,
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Radio<SingingCharacter>(
                                  activeColor: const Color(0xff4f574a),
                                  value: SingingCharacter.Unhelpful,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                                const Text('Unwholesome',
                                    style: const TextStyle(
                                        color: const Color(0xff4f574a),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ],
                            ).pOnly(right: 2.w)),
                      ],
                    ),
                    2.h.heightBox,
                    Text('Distortions', style: text2),
                    0.5.h.heightBox,
                    TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          // fillColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          hintText:
                              '''I quietly walk out of the class without     talking to anyone.''',
                          hintStyle: text6,
                          hintMaxLines: 2),
                    ),
                  ],
                ).p(3.w),
                1.5.h.heightBox,
              ]),
        ),
      ]).p(3.w),
    ));
  }
}

enum SingingCharacter { Helpful, Unhelpful }
