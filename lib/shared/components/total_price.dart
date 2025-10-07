import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/shared/components/custom_botton.dart';
import 'package:open_fashion/shared/components/custom_text.dart';
import 'package:open_fashion/core/app_colors.dart';

import 'package:open_fashion/shared/models/product_model.dart';

class TotalPrice extends StatefulWidget {
  const TotalPrice({
    super.key,
    required this.product,
    required this.selecteQuantity,
    required this.textBotton,
    required this.onTap,
  });

  final ProductModel product;
  final int selecteQuantity;
  final String textBotton;
  final Widget onTap;
  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, bottom: 25.h, right: 20.w),
          child: Row(
            children: [
              CustomText(
                text: 'E S T. T O T A L',
                color: AppColors.primaryColor,
                fontSize: 14,
              ),
              Spacer(),
              CustomText(
                text: '\$ ${widget.product.price * widget.selecteQuantity}',
                color: Color.fromRGBO(221, 133, 96, 1),
                fontSize: 18,
                //  weight: FontWeight.bold,
              ),
            ],
          ),
        ),
        CustomBotton(
          isSvg: true,
          text: widget.textBotton.toUpperCase(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) {
                  return widget.onTap;
                 
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
