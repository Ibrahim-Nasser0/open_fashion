import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/core/app_colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 340.h,
      decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),

      child: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset(
                'assets/icons/twitter icon.svg',
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 50.w),
              SvgPicture.asset(
                'assets/icons/Instagram icon.svg',
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 50.w),
              SvgPicture.asset(
                'assets/icons/YouTube icon.svg',
                width: 24.w,
                height: 24.h,
              ),
              Spacer(),
            ],
          ),

          //line
          SizedBox(height: 30.h),
          SvgPicture.asset(
            'assets/logo/line.svg',
            // ignore: deprecated_member_use
            color: AppColors.primaryColor,
            width: 124.95.w,
            height: 9.h,
          ),

          SizedBox(height: 20.h),
          Text(
            "support@openui.design\n        +60 825 876\n08:00 - 22:00 - Everyday",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryColor,
              fontFamily: 'TenorSans',
            ),
          ),

          //line
          SizedBox(height: 20.h),
          SvgPicture.asset(
            'assets/logo/line.svg',
            // ignore: deprecated_member_use
            color: AppColors.primaryColor,
            width: 124.95.w,
            height: 9.h,
          ),

          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "About",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: 'TenorSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "Contact",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: 'TenorSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "Blog",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                  fontFamily: 'TenorSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),

          SizedBox(height: 35.h),
          Container(
            alignment: Alignment.center,
            height: 45.24551010131836.h,
            width: 375.w,
            color: Color.fromRGBO(196, 196, 196, 1),
            child: Text(
              "Copyright© OpenUI All Rights Reserved.",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color.fromRGBO(85, 85, 85, 1),
                fontFamily: 'TenorSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
