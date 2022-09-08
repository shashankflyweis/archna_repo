import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/contant.dart';

class DialogContainer extends StatelessWidget {
  double? width1;
  String? texts;

  DialogContainer({
    Key? key,
    this.width1,
    this.texts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5.h,
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
          ),
          decoration: BoxDecoration(
              color: ratingcolor, borderRadius: BorderRadius.circular(5.sp)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${texts}",
              style: text24,
            ),
          )),
        )
      ],
    );
  }
}
