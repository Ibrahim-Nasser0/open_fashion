import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/shared/components/custom_text.dart';
import 'package:open_fashion/core/app_colors.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    this.isSvg = false,
    required this.text,
    required this.onTap,
  });

  final bool isSvg;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),

        child: isSvg
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (SvgPicture.asset('assets/logo/shopping bag.svg')),

                  SizedBox(width: 15.w),
                  CustomText(text: text.toUpperCase()),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomText(text: text.toUpperCase())],
              ),
      ),
    );
  }
}
