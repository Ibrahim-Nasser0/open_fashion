import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_fashion/feaures/addCard/components/card_form.dart';
import 'package:open_fashion/shared/components/custom_appbar.dart';
import 'package:open_fashion/shared/components/custom_botton.dart';
import 'package:open_fashion/shared/components/custom_title.dart';
import 'package:open_fashion/feaures/addCard/models/card_data_model.dart';

CardDataModel? cardData;

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlack: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            CustomTitle(title: 'Payment method'),

            CardForm(),

            Spacer(),
            CustomBotton(text: "add card", onTap: () {}),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
