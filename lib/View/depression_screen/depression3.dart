import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/bottom_nav.dart';
import '../../constant/contant.dart';
import '../Home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:archna_frontend/models/variables/service.dart';
class Depression3 extends StatefulWidget {
  @override
  State<Depression3> createState() => _Depression3State();
}
String problem = '';
String solution = '';
getvalues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  problem = prefs.getString('depressionSeverity').toString();
  solution = prefs.getString('proposedTreatment').toString();
}

class _Depression3State extends State<Depression3> {
  @override
  void initState() {
    super.initState();
    getvalues();
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: depression,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('And your final score was', style: text4),
            1.h.heightBox,
            Text(
                '''Explainer Text for explaining the scoring of this test. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu quam sed orci eleifend fermentum. Integer lobortis convallis tortor, eu congue elit ultrices sit amet. Nulla tempus turpis eu mauris porttitor, eu posuere libero sodales. Aenean euismod erat eget commodo porta.'''),
            1.h.heightBox,
            Text('We think you may have',
                style: TextStyle(
                    color: Color(0xff826250),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            1.h.heightBox,
            Text('${service.problem} Depression', style: text4),
            1.h.heightBox,
            Text(
                '${service.solution}',
                style: TextStyle(fontSize: 12.sp)),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: btnblack,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'How do I combat this?',
                style: text8,
              ).centered().p(3.5.w),
            ).p(3.w).onTap(() {
              Get.to(() => Bottom2());
            }),
          ],
        ).p(3.h),
      ),
    );
  }
}
