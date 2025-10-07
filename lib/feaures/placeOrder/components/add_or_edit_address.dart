import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/feaures/addAddress/view/add_new_address.dart';
import 'package:open_fashion/feaures/placeOrder/components/address_info.dart';
import 'package:open_fashion/shared/components/custom_text.dart';

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
