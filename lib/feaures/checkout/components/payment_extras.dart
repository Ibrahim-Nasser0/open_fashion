import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/shared/components/custom_text.dart';

class PaymentExtrasWidget extends StatefulWidget {
  const PaymentExtrasWidget({super.key});

  @override
  State<PaymentExtrasWidget> createState() => _PaymentExtrasWidgetState();
}

class _PaymentExtrasWidgetState extends State<PaymentExtrasWidget> {
  bool addPromo = true;
  final List<String> promoCode = ['PROMO1', 'PROMO2', 'PROMO3', 'IBRAHIM'];
  TextEditingController promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 343.w,
          height: 1.h,
          color: const Color.fromARGB(54, 0, 0, 0),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 33.w, right: 33.w),
          child: GestureDetector(
            onTap: () {
              setState(() {
                addPromo = !addPromo;
              });
            },

            child: SizedBox(
              width: 315.w,
              height: 44.h,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/promo code.svg',
                    height: 14.4.h,
                    width: 21.w,
                    // ignore: deprecated_member_use
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 10.w),
                  addPromo
                      ? CustomText(
                          text: 'Add promo code',
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          weight: FontWeight.w400,
                        )
                      : Expanded(
                          child: TextField(
                            onEditingComplete: () {
                              if (promoCode.contains(promoController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("✅ Promo code applied!"),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("❌ Invalid promo code"),
                                  ),
                                );
                              }
                            },
                            controller: promoController,

                            decoration: InputDecoration(
                              label: CustomText(
                                text: 'Enter promo code',
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                weight: FontWeight.w400,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: AppColors.primaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),

        Container(
          width: 343.w,
          height: 1.h,
          color: const Color.fromARGB(54, 0, 0, 0),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 33.w, right: 33.w),
          child: Column(
            children: [
              SizedBox(
                width: 315.w,
                height: 44.h,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Door to Door Delivery.svg',
                      height: 24.h,
                      width: 24.w,
                      // ignore: deprecated_member_use
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: 'Delivery',
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      weight: FontWeight.w400,
                    ),

                    Spacer(),
                    CustomText(
                      text: 'Free',
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          width: 343.w,
          height: 1.h,
          color: const Color.fromARGB(54, 0, 0, 0),
        ),
      ],
    );
  }
}
