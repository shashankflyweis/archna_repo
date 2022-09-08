import 'package:archna_frontend/View/distortion/question/distortion_controller.dart';
import 'package:archna_frontend/Widgets/dialog_container.dart';
import 'package:archna_frontend/constant/bottom_nav.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Score2 extends StatefulWidget {
  Score2({Key? key}) : super(key: key);

  @override
  State<Score2> createState() => _Score2State();
}

class _Score2State extends State<Score2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fscolor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            15.h.heightBox,
            Image.asset(
              "assets/images/party.png",
            ),
            2.h.heightBox,
            Text(
              "Amazing!",
              style: text30,
            ),
            2.h.heightBox,
            Text(
              "Thank you for completing this lesson. In further lessons, we will learn ...",
              style: text25,
            ),
            30.h.heightBox,
            Container(
              height: 14.h,
              width: 100.w,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: sp15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How would you rate this lesson?",
                    style: text23,
                  ),
                  2.h.heightBox,
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(Icons.star_border_outlined,
                            size: 30.sp, color: Starcolor),
                      8.w.widthBox,
                      Text(
                        "Not rated",
                        style: TextStyle(color: Starcolor),
                      )
                    ],
                  )
                ],
              ).p16(),
            ).onTap(() {
              _BottomSheet(context);
            }),
            5.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ask me later",
                  style: text23,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 13.sp,
                  color: Colors.black,
                )
              ],
            )
          ],
        ).pSymmetric(h: 2.h),
      ),
    );
  }

  void _BottomSheet(context) {
    barrierDismissible:
    false;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: 50.w,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How would you rate this lesson?",
                    style: text26,
                  ),
                  2.h.heightBox,
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: ratingcolor,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      5.w.widthBox,
                      Text(
                        "Good",
                        style: text23,
                      ),
                    ],
                  ),
                  2.h.heightBox,
                  Row(
                    children: [
                      DialogContainer(
                        width1: 40.w,
                        texts: "Easy to understand",
                      ),
                      4.w.widthBox,
                      Container(
                        height: 5.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                            child: Text(
                          "Clearly explained",
                          style: text25,
                        )),
                      )
                    ],
                  ),
                  2.h.heightBox,
                  Row(
                    children: [
                      DialogContainer(
                        width1: 40.w,
                        texts: "Practically useful",
                      ),
                      4.w.widthBox,
                      Container(
                        height: 5.h,
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Quick to finish",
                            style: text25,
                          ),
                        )),
                      )
                    ],
                  ),
                  2.h.heightBox,
                  DialogContainer(
                    width1: 40.w,
                    texts: "Would recommend to others",
                  ),
                  3.h.heightBox,
                  Text(
                    "More feedback",
                    style: text26,
                  ),
                  2.h.heightBox,
                  Container(
                    height: 15.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: TextFormField(
                      maxLines: 10,
                      decoration: const InputDecoration(
                          hintText:
                              "Please tell us more about your\nexperience",
                          border: InputBorder.none),
                    ).p12(),
                  ),
                  4.h.heightBox,
                  Container(
                    height: 8.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Center(
                      child: Text(
                        "Submit feedback",
                        style: text24,
                      ),
                    ),
                  ).onTap(() {
                    Get.to(() => Bottom2(),
                        arguments: Get.delete<DistortionController>());
                  }),
                ],
              ).p12(),
            ),
            floatingActionButton: Container(
              transform: Matrix4.translationValues(0.0, -60, 0.0),
              child: FloatingActionButton(
                focusColor: Colors.black,
                backgroundColor: Colors.black.withOpacity(0.5),
                onPressed: () {},
                child: Icon(
                  Icons.cancel_outlined,
                  size: 25.sp,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerTop,
          ),
        );
      },
    );
  }
}
