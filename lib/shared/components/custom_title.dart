import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/shared/components/custom_text.dart';
import 'package:open_fashion/core/app_colors.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: title.toUpperCase(),
              color: AppColors.primaryColor,
              fontSize: 18,
              weight: FontWeight.w400,
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/logo/line.svg',
          // ignore: deprecated_member_use
          color: AppColors.primaryColor,
          width: 124.95879364013672.w,
          height: 9.h,
        ),
      ],
    );
  }
}
