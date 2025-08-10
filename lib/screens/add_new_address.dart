import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/components/custom_appbar.dart';
import 'package:open_fashion/components/custom_botton.dart';

import 'package:open_fashion/components/custom_text_field.dart';
import 'package:open_fashion/components/custom_title.dart';

// ignore: must_be_immutable
class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key, this.editData});
  final dynamic editData;

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController adress = TextEditingController();

  TextEditingController city = TextEditingController();

  TextEditingController state = TextEditingController();

  TextEditingController zipCode = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    adress.dispose();
    city.dispose();
    state.dispose();
    zipCode.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.editData != null) {
      firstName.text = widget.editData['firstName'];
      lastName.text = widget.editData['lastName'];
      adress.text = widget.editData['adress'];
      city.text = widget.editData['city'];
      state.text = widget.editData['state'];
      zipCode.text = widget.editData['zipCode'];
      phoneNumber.text = widget.editData['phoneNumber'];
    }
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Column(
        children: [
          ShippingAddressForm(
            firstName: firstName,
            lastName: lastName,
            adress: adress,
            city: city,
            state: state,
            zipCode: zipCode,
            phoneNumber: phoneNumber,
            formKey: _formKey,
          ),

          Spacer(),

          CustomBotton(
            text: 'add now',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                // ignore: unused_local_variable
                final Map<String, dynamic> data = {
                  'firstName': firstName.text,
                  'lastName': lastName.text,
                  'adress': adress.text,
                  'city': city.text,
                  'state': state.text,
                  'zipCode': zipCode.text,
                  'phoneNumber': phoneNumber.text,
                };
                Navigator.pop(context, data);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill all the fields')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

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
