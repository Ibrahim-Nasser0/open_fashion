import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HeaderDecorations extends StatelessWidget {
  const HeaderDecorations({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -0.43.h,
          left: 90.99.w,
          width: 173.6.w,
          height: 125.28.h,

          child: SvgPicture.asset('assets/texts/10.svg'),
        ),
        Positioned(
          top: 15.48.h,
          left: 112.93.w,
          width: 163.w,
          height: 63.h,
          child: SvgPicture.asset('assets/texts/October.svg'),
        ),
        Positioned(
          top: 62.86.h,
          left: 119.61.w,
          width: 145.58518981933594.w,
          height: 29.11703872680664.h,

          child: SvgPicture.asset('assets/texts/Collection.svg'),
        ),
      ],
    );
  }
}
