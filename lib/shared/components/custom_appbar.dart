import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.isBlack});
  @override
  Size get preferredSize => Size.fromHeight(60.h);
  final bool isBlack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isBlack
          ? AppColors.primaryColor
          : AppColors.secondaryColor,
      centerTitle: true,

      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: SvgPicture.asset(
          'assets/logo/Menu.svg',
          height: 24.h,
          width: 24.w,
          // ignore: deprecated_member_use
          color: isBlack ? AppColors.secondaryColor : AppColors.primaryColor,
        ),
      ),
      leadingWidth: 45.w, //ToDo

      title: SvgPicture.asset(
        'assets/logo/Logo.svg',
        // ignore: deprecated_member_use
        color: isBlack ? AppColors.secondaryColor : AppColors.primaryColor,
      ),

      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SvgPicture.asset(
            'assets/logo/Search.svg',
            height: 24,
            width: 24,
            // ignore: deprecated_member_use
            color: isBlack ? AppColors.secondaryColor : AppColors.primaryColor,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(
            'assets/logo/shopping bag.svg',
            height: 24.h,
            width: 24.w,
            // ignore: deprecated_member_use
            color: isBlack ? AppColors.secondaryColor : AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
