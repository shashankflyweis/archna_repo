import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:archna_frontend/models/variables/service.dart';

class Anxiety3 extends GetView<Anxiety3> {
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
            Text(
                '''Explainer Text for explaining the scoring of this test. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu quam sed orci eleifend fermentum. Integer lobortis convallis tortor, eu congue elit ultrices sit amet. Nulla tempus turpis eu mauris porttitor, eu posuere libero sodales. Aenean euismod erat eget commodo porta.'''),
            1.h.heightBox,
            Text('We think you may have',
                style: TextStyle(
                    color: Color(0xff827850),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            1.h.heightBox,
            Text('${service.anxiety_problem} Anxiety', style: text4),
            1.h.heightBox,
            Text(
                '''Phasellus rutrum ex finibus, venenatis turpis eget, venenatis odio. Vivamus at elit volutpat, imperdiet libero vel, aliquam neque. Praesent placerat, massa et bibendum elementum, lacus eros tincidunt urna, a dapibus justo odio sed nulla. Phasellus blandit sodales diam sed tincidunt. Sed ex nunc, egestas ut dictum in, scelerisque a velit. Cras nibh lectus, feugiat vehicula mattis et, luctus sed eros. Suspendisse lobortis felis nec orci aliquet pharetra. Integer vestibulum neque et tortor venenatis placerat. Aenean tempor tellus nisl, et dignissim sem porttitor id. Morbi egestas pulvinar enim, eu posuere purus volutpat eu. Donec eu eros urna.test. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu quam sed orci eleifend fermentum. 
                ''',
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
            ).p(3.w),
          ],
        ).p(3.h),
      ),
    );
  }
}
