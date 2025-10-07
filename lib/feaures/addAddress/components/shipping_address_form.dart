import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/shared/components/custom_text_field.dart';
import 'package:open_fashion/shared/components/custom_title.dart';

class ShippingAddressForm extends StatelessWidget {
  const ShippingAddressForm({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.adress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.phoneNumber,
    required this.formKey,
  });

  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController adress;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController zipCode;
  final TextEditingController phoneNumber;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            CustomTitle(title: 'Add shipping adress'),

            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(
                  width: 155.w,
                  height: 50.h,
                  child: CustomTextField(
                    hintText: 'First Name',
                    controller: firstName,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 155.w,
                  height: 50.h,
                  child: CustomTextField(
                    hintText: 'Last Name',
                    controller: lastName,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.h),
            CustomTextField(
              hintText: 'Adress',
              controller: adress,
              keyboardType: TextInputType.streetAddress,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),

            SizedBox(height: 15.h),
            CustomTextField(
              hintText: 'City',
              controller: city,
              keyboardType: TextInputType.text,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
            ),

            SizedBox(height: 15.h),
            Row(
              children: [
                SizedBox(
                  width: 155.w,
                  height: 50.h,
                  child: CustomTextField(
                    hintText: 'State',
                    controller: state,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter your state';
                      }
                      return null;
                    },
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 155.w,
                  height: 50.h,
                  child: CustomTextField(
                    hintText: 'ZIP Code',
                    controller: zipCode,
                    keyboardType: TextInputType.number,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter your ZIP code';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.h),
            CustomTextField(
              hintText: 'Phone Number',
              controller: phoneNumber,
              keyboardType: TextInputType.phone,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}