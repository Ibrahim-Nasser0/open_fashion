import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/feaures/home/components/about.dart';
import 'package:open_fashion/feaures/home/components/cover_slider.dart';
import 'package:open_fashion/feaures/home/components/product_grid_view.dart';

import 'package:open_fashion/shared/components/custom_text.dart';

class HomeBodyContent extends StatelessWidget {
  const HomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(height: 130.h),
                Image.asset('assets/cover/slider caver3.png'),

                SizedBox(height: 20.h),
                ProductGridView(),

                SizedBox(height: 15.h),
                const CustomText(text: 'YOU MAY ALSO LIKE', fontSize: 18),
                SizedBox(height: 5.h),
                SvgPicture.asset('assets/logo/line.svg'),

                SizedBox(height: 15.h),
                CoverSlider(),
              ],
            ),
          ),
          About(),
        ],
      ),
    );
  }
}
