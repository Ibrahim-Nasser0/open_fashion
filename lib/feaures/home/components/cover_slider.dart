import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/feaures/home/models/cover_model.dart';
import 'package:open_fashion/shared/components/custom_text.dart';

class CoverSlider extends StatelessWidget {
  const CoverSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: covers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  covers[index].image,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                CustomText(text: covers[index].title, fontSize: 13),
              ],
            ),
          );
        },
      ),
    );
  }
}
