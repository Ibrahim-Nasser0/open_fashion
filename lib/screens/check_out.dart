import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/components/custom_appbar.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/components/custom_title.dart';
import 'package:open_fashion/components/total_price.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/place_order.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key, required this.product});
  final ProductModel product;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selecteQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        children: [
          SizedBox(height: 20.h),

          CustomTitle(title: 'C H E C K O U T'),
          SizedBox(height: 20.h),

          CheckoutCard(
            product: widget.product,
            onChange: (v) {
              setState(() {
                selecteQuantity = v;
              });
            },
          ),
          SizedBox(height: 20.h),

          PaymentExtrasWidget(),

          Spacer(),
          TotalPrice(
            product: widget.product,
            selecteQuantity: selecteQuantity,
            textBotton: "CHECKOUT",
            onTap: PlaceOrder(
              product: widget.product,
              quantity: selecteQuantity,
            ),
          ),
        ],
      ),
    );
  }
}

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
