import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/shared/components/custom_text.dart';
import 'package:open_fashion/shared/models/product_model.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    super.key,
    required this.product,
    required this.onChange,
  });

  final ProductModel product;
  final Function(int) onChange;
  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      height: 134.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.asset(widget.product.image),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              CustomText(
                text: widget.product.name.toUpperCase(),
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 5.h),
              CustomText(
                text: widget.product.description,
                fontSize: 12,
                color: Color.fromRGBO(85, 85, 85, 1),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (count > 1) {
                          count--;
                          widget.onChange(count);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove_sharp,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),

                  Text(count.toString()),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (count < 50) {
                          count++;
                          widget.onChange(count);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.add_sharp,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              CustomText(
                text: '\$${widget.product.price.toString()}',
                fontSize: 15,
                color: Color.fromRGBO(221, 133, 96, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
