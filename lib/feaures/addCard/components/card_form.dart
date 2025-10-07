import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/feaures/addCard/view/add_card.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = "";

  String expiryDate = "";

  String cardHolderName = "";

  String cvvCode = "";

  bool isShow = false;

  final cardNumberKey = GlobalKey<FormFieldState<String>>();

  final expiryDateKey = GlobalKey<FormFieldState<String>>();

  final cardHolderKey = GlobalKey<FormFieldState<String>>();

  final cvvCodeKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isShow,

          isHolderNameVisible: true,
          cardBgColor: Colors.black,
          obscureCardCvv: isShow,

          //  isCvvFocused, //true when you want to show cvv(back) view
          onCreditCardWidgetChange:
              (
                CreditCardBrand brand,
              ) {}, // Callback for anytime credit card brand is changed
        ),

        CreditCardForm(
          formKey: formKey,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          cardNumberKey: cardNumberKey,
          cvvCodeKey: cvvCodeKey,
          expiryDateKey: expiryDateKey,
          cardHolderKey: cardHolderKey,

          onCreditCardModelChange: (CreditCardModel data) {
            setState(() {
              cardNumber = data.cardNumber;
              expiryDate = data.expiryDate;
              cardHolderName = data.cardHolderName;
              cvvCode = data.cvvCode;
              isShow =
                  data.isCvvFocused; //true when you want to show cvv(back) view
            });
          },

          cardNumberValidator: (value) =>
              value == null || value.isEmpty ? 'Enter valid card number' : null,
          expiryDateValidator: (value) =>
              value == null || value.isEmpty ? 'Enter valid date' : null,
          cvvValidator: (value) =>
              value == null || value.length < 3 ? 'Enter valid CVV' : null,
          cardHolderValidator: (value) =>
              value == null || value.isEmpty ? 'Enter card holder name' : null,

          obscureCvv: true,
          obscureNumber: true,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          enableCvv: true,
          isCardHolderNameUpperCase: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          disableCardNumberAutoFillHints: false,

          onFormComplete: () {
            if (formKey.currentState!.validate()) {
              cardData!.cardHolderName = cardHolderName;
              cardData!.cardNumber = cardNumber;
              cardData!.expiryDate = expiryDate;
              cardData!.cvv = cvvCode;
            }
          },

          inputConfiguration: const InputConfiguration(
            cardHolderDecoration: InputDecoration(
              focusColor: AppColors.primaryColor,
              fillColor: AppColors.primaryColor,
              hoverColor: AppColors.primaryColor,

              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(212, 212, 212, 1),
                  style: BorderStyle.solid,
                ),
              ),
              labelText: 'Name On Card',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(151, 151, 151, 1),
                fontFamily: "TenorSans",
              ),
            ),

            cardNumberDecoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(212, 212, 212, 1)),
              ),
              labelText: 'Card Number',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(151, 151, 151, 1),
                fontFamily: "TenorSans",
              ),
              hintText: 'XXXX XXXX XXXX XXXX',
            ),

            expiryDateDecoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(212, 212, 212, 1)),
              ),
              labelText: 'Expired Date',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(151, 151, 151, 1),
                fontFamily: "TenorSans",
              ),
              hintText: 'XX/XX',
            ),

            cvvCodeDecoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(212, 212, 212, 1)),
              ),
              labelText: 'CVV',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(151, 151, 151, 1),
                fontFamily: "TenorSans",
              ),
              hintText: 'XXX',
            ),

            cardNumberTextStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: "TenorSans",
            ),

            cardHolderTextStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: "TenorSans",
            ),

            expiryDateTextStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: "TenorSans",
            ),

            cvvCodeTextStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: "TenorSans",
            ),
          ),
        ),
      ],
    );
  }
}
