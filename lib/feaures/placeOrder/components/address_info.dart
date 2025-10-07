import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/shared/components/custom_text.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({super.key, this.savedAddress});
  final dynamic savedAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            alignment: Alignment.topLeft,
            width: 302.w,
            height: 91.h,
            color: Color.fromRGBO(249, 249, 249, 1),

            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          '${savedAddress['firstName']} ${savedAddress['lastName']}',
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      text: savedAddress['adress'],
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 14,
                    ),

                    CustomText(
                      text:
                          '${savedAddress['city']}, ${savedAddress['state']} ${savedAddress['zipCode']}',
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 14,
                    ),

                    CustomText(
                      text: savedAddress['phoneNumber'],
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 14,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color.fromRGBO(51, 51, 51, 1),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
