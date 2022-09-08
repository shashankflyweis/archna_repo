import 'package:archna_frontend/View/depression_screen/depression3.dart';
import 'package:archna_frontend/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/contant.dart';

class Depression2 extends GetView<Depression2> {
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
            Text.rich(TextSpan(children: [
              TextSpan(text: '15', style: text4),
              TextSpan(
                  text: '  out of 63',
                  style: TextStyle(
                      color: Color(0xff826250),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600))
            ])),
            1.h.heightBox,
            Text(
                '''Explainer Text for explaining the scoring of this test. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu quam sed orci eleifend fermentum. Integer lobortis convallis tortor, eu congue elit ultrices sit amet. Nulla tempus turpis eu mauris porttitor, eu posuere libero sodales. Aenean euismod erat eget commodo porta. Vestibulum risus ante, porttitor imperdiet lorem vel, commodo pulvinar arcu. Nulla pharetra euismod metus, ac sollicitudin arcu auctor in. Cras convallis iaculis luctus. Etiam eu elit ac quam sollicitudin feugiat in vitae lectus. Duis nec ullamcorper neque. Fusce vestibulum justo sed erat vehicula, sed eleifend ipsum elementum.''',

                style: TextStyle(fontSize: 12.sp)),
            Spacer(),
            InkWell(
              onTap: () => Get.to(Depression3()),
              child: Container(
                decoration: BoxDecoration(
                  color: btnblack,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Got it!',
                  style: text8,
                ).centered().p(3.5.w),
              ).p(3.w),
            ),
          ],
        ).p(3.h),
      ),
    );
  }
}
