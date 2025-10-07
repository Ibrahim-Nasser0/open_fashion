import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/feaures/checkout/components/checkout_card.dart';
import 'package:open_fashion/feaures/checkout/components/payment_extras.dart';
import 'package:open_fashion/shared/components/custom_appbar.dart';
import 'package:open_fashion/shared/components/custom_title.dart';
import 'package:open_fashion/shared/components/total_price.dart';
import 'package:open_fashion/feaures/placeOrder/view/place_order.dart';
import 'package:open_fashion/shared/models/product_model.dart';

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
      body: SafeArea(
        child: Column(
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
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

