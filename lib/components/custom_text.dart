import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColors.secondaryColor,
    this.weight = FontWeight.normal,
    this.isIttalic = false,
    this.max = 1,
  });

  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight weight;
  final bool isIttalic;
  final int max;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      style: TextStyle(
        fontSize: fontSize.sp,
        color: color,
        fontFamily: "TenorSans",
        fontWeight: weight,
        fontStyle: isIttalic ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
