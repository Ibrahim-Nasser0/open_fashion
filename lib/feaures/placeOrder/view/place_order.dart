import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/feaures/placeOrder/components/add_or_edit_address.dart';
import 'package:open_fashion/feaures/placeOrder/components/shipping_option_card.dart';
import 'package:open_fashion/shared/components/custom_appbar.dart';
import 'package:open_fashion/shared/components/custom_text.dart';
import 'package:open_fashion/shared/components/custom_title.dart';
import 'package:open_fashion/shared/components/total_price.dart';
import 'package:open_fashion/feaures/addCard/view/add_card.dart';

import 'package:open_fashion/shared/models/product_model.dart';

// ignore: must_be_immutable
class PlaceOrder extends StatefulWidget {
  PlaceOrder({super.key, required this.product, required this.quantity});
  int quantity;
  final ProductModel product;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool _pickupAtStore = true;
  bool _cash = false;
  bool _select = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          CustomTitle(title: 'C H E C K O U T'),

          SizedBox(height: 20.h),
          AddOrEditAddress(),

          //Shipping Method
          SizedBox(height: 25.h),
          PopupMenuButton(
            splashRadius: 29,
            shadowColor: Colors.white,

            color: const Color.fromRGBO(247, 247, 247, 1),

            borderRadius: BorderRadius.circular(44.r),
            popUpAnimationStyle: AnimationStyle(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInQuint,
              reverseDuration: const Duration(milliseconds: 500),
            ),
            onSelected: (value) {
              setState(() {
                _pickupAtStore = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: true,

                child: Row(
                  children: [
                    Icon(Icons.store, color: Color.fromRGBO(85, 85, 85, 1)),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: 'At Store',
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: false,
                child: Row(
                  children: [
                    Icon(
                      Icons.local_shipping,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: 'Delivery',
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ],
                ),
              ),
            ],
            child: ShippingOptionCard(
              title: 'Shipping Method',
              subtitle: _pickupAtStore ? 'Pickup At Store' : 'Delivery To Home',
              isFree: _pickupAtStore,
              isIcon: true,
              icon: _pickupAtStore ? Icons.store : Icons.local_shipping,
              /*
              startSubtitle: true,
              startSuptitle: 'Select Picup Method',
              TODO
            */
            ),
          ),

          //Payment Method
          SizedBox(height: 25.h),
          PopupMenuButton(
            splashRadius: 29,
            shadowColor: Colors.white,

            color: const Color.fromRGBO(247, 247, 247, 1),

            borderRadius: BorderRadius.circular(44.r),
            popUpAnimationStyle: AnimationStyle(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInQuint,
              reverseDuration: const Duration(milliseconds: 500),
            ),
            onSelected: (value) {
              setState(() {
                _cash = value;
              });
            },

            itemBuilder: (context) => [
              PopupMenuItem(
                value: true,

                onTap: () {
                  setState(() {
                    _select = false;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: 'Credit card',
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: false,
                onTap: () {
                  setState(() {
                    _select = false;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.money, color: Color.fromRGBO(85, 85, 85, 1)),
                    SizedBox(width: 10.w),
                    CustomText(
                      text: 'Cash on Delivery',
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ],
                ),
              ),
            ],
            child: ShippingOptionCard(
              title: 'Payment method',
              subtitle: _cash ? 'Credit card' : 'Cash on Delivery',
              startSubtitle: _select,
              startSuptitle: 'select payment method',
              isIcon: true,
              icon: _cash ? Icons.credit_card : Icons.money,
            ),
          ),

          //Total Price and Botton
          Spacer(),
          TotalPrice(
            product: widget.product,
            selecteQuantity: widget.quantity,
            textBotton: "Place order",
            onTap: _cash ? AddCard() : AddCard(),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

