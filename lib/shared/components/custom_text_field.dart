import 'package:flutter/material.dart';
import 'package:open_fashion/shared/components/custom_text.dart';
import 'package:open_fashion/core/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      validator: validator,

      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(151, 151, 151, 1)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        label: CustomText(
          text: hintText,
          color: Color.fromRGBO(151, 151, 151, 1),
        ),
      ),
    );
  }
}
