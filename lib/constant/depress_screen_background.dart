import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DebackGroundColor extends StatelessWidget {
  var child;
  DebackGroundColor({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(color: Color(0xffFFBE99)),
      child: child,
    );
  }
}
