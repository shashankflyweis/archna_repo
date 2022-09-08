import 'package:archna_frontend/View/exercise/exercise_screen1.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:archna_frontend/models/variables/service.dart';

class KeyTakeAway extends StatefulWidget {
  KeyTakeAway({Key? key}) : super(key: key);

  @override
  State<KeyTakeAway> createState() => _KeyTakeAwayState();
}

class _KeyTakeAwayState extends State<KeyTakeAway> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themAppcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            6.h.heightBox,
            Row(
              children: [
                Image.asset(
                  "assets/images/canimg.png",
                ),
                3.w.widthBox,
                Container(
                  width: 84.w,
                  child: StepProgressIndicator(
                    totalSteps: service.total,
                    currentStep: service.step,
                    size: 8,
                    padding: 0,
                    selectedColor: Colors.black,
                    unselectedColor: Colors.grey,
                    roundedEdges: const Radius.circular(10),
                  ),
                ),
              ],
            ),
            4.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                InkWell(
                    onTap: () {
                      service.step++;
                      Get.to(() => ExerciseScreen1(), arguments: 60);
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.black)),
              ],
            ),
            4.h.heightBox,
            SizedBox(
            height:1000.w,
              child: ListView.builder(
                itemCount: service.summary.length-1,
                itemBuilder: (context,index){
                return Column(
                  children: [
                    Container(decoration: BoxDecoration(
   
    borderRadius: BorderRadius.all(Radius.circular(50))
  ),child:Stack(
                        children:  ([
                             Image.asset("assets/images/frame6_cleanup.png"),
                              
                            Padding(
                              padding:  EdgeInsets.only(top:13.w),
                              child: Align(child: Text(service.summary[index],style: text25,),)),

                           
                        ])
                    )),
                    2.h.heightBox
                  ],
                );
                }
          ),
            ),
            // Image.asset("assets/images/frame6.png"),
            // 2.h.heightBox,
            // Image.asset("assets/images/frame7.png"),
            // 2.h.heightBox,
            // Image.asset("assets/images/frame89.png"),
            // 4.h.heightBox,
            // Image.asset("assets/images/frame9.png"),
          ],
        ).pSymmetric(h: 2.h),
      ),
    );
  }
}
