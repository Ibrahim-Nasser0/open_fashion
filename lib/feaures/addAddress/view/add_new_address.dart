import 'package:flutter/material.dart';

import 'package:open_fashion/feaures/addAddress/components/shipping_address_form.dart';
import 'package:open_fashion/shared/components/custom_appbar.dart';
import 'package:open_fashion/shared/components/custom_botton.dart';


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
