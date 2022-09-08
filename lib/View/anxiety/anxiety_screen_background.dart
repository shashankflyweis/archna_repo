import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnxietyBackground extends StatelessWidget {
  var child;
  AnxietyBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(color: Color(0xffffe999)),
      child: child,
    );
  }
}
