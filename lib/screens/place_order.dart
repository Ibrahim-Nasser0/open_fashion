import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/components/custom_appbar.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/components/custom_title.dart';
import 'package:open_fashion/components/total_price.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/add_card.dart';
import 'package:open_fashion/screens/add_new_address.dart';

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
        ],
      ),
    );
  }
}

class AddOrEditAddress extends StatefulWidget {
  const AddOrEditAddress({super.key});

  @override
  State<AddOrEditAddress> createState() => _AddOrEditAddressState();
}

class _AddOrEditAddressState extends State<AddOrEditAddress> {
  dynamic _savedAddress;
  void _openAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddNewAddress()),
    );

    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  // ignore: unused_element
  void _editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddNewAddress(editData: _savedAddress)),
    );
    setState(() {
      _savedAddress = newAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'SHIPPING ADDRESS',
          color: Color.fromRGBO(136, 136, 136, 1),
          fontSize: 14,
        ),
        _savedAddress != null
            ? GestureDetector(
                onTap: () {
                  _editAddress();
                },

                child: Container(
                  alignment: Alignment.topLeft,
                  width: 342.w,
                  height: 135.54.h,
                  child: AddressInfo(savedAddress: _savedAddress),
                ),
              )
            : GestureDetector(
                onTap: () {
                  _openAddress(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 342.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.circular(44.r),
                  ),
                  child: Row(
                    children: [
                      CustomText(
                        text: 'Add shipping adress',
                        color: Color.fromRGBO(85, 85, 85, 1),
                      ),
                      Spacer(),

                      Icon(Icons.add, size: 20.sp),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}

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
