import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:open_fashion/shared/components/custom_text.dart';


class ShippingOptionCard extends StatelessWidget {
  const ShippingOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isFree = false,
    this.isIcon = false,
    this.icon = Icons.local_shipping,
    this.startSubtitle = false,
    this.startSuptitle = '',
  });
  final String title;
  final String subtitle;
  final bool isFree;
  final bool isIcon;
  final IconData icon;
  final bool startSubtitle;
  final String startSuptitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 67.h,
      decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(44.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CustomText(
            text: title.toUpperCase(),
            color: Color.fromRGBO(136, 136, 136, 1),
            fontSize: 14,
          ),
          SizedBox(height: 10.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                isIcon
                    ? Icon(icon, color: Color.fromRGBO(85, 85, 85, 1))
                    : SizedBox(),
                isIcon ? SizedBox(width: 10.w) : SizedBox(),

                startSubtitle
                    ? CustomText(
                        text: startSuptitle,
                        color: Color.fromRGBO(85, 85, 85, 1),
                      )
                    : CustomText(
                        text: subtitle,
                        color: Color.fromRGBO(85, 85, 85, 1),
                      ),

                Spacer(),

                isFree
                    ? CustomText(
                        text: 'FREE',
                        color: Color.fromRGBO(85, 85, 85, 1),
                        fontSize: 14,
                      )
                    : const SizedBox(),

                SizedBox(width: 10.w),

                Icon(Icons.keyboard_arrow_down, size: 20.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
