import 'package:bhootfashion/component/custom_AppBar.dart';
import 'package:bhootfashion/component/custom_button.dart';
import 'package:bhootfashion/component/custom_header.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;

  final _key = GlobalKey<FormState>();
  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(
        isBlackk: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(15),
            const CustomHeader(text: 'payment method'),
            const Gap(3),
            CreditCardWidget(
              padding: 6,
              cardBgColor: AppColors.primary,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isShow, //true when you want to show cvv(back) view
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
              obscureCardNumber: true,
              isHolderNameVisible:
                  true, // Callback for anytime credit card brand is changed
            ),
            const Gap(5),
            CreditCardForm(
              formKey: _key,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: onCreditCardModelChange,
              isCardHolderNameUpperCase: true,
              obscureCvv: true,
              inputConfiguration: const InputConfiguration(
                cardNumberTextStyle: TextStyle(fontFamily: "TenorSans"),
                cardNumberDecoration: InputDecoration(
                  hintText: "Card Number",
                  hintStyle: TextStyle(fontFamily: "TenorSans"),
                  counterStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                cardHolderTextStyle: TextStyle(fontFamily: "TenorSans"),
                cardHolderDecoration: InputDecoration(
                  hintText: "NAME",
                  hintStyle: TextStyle(fontFamily: "TenorSans"),
                  counterStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                cvvCodeTextStyle: TextStyle(fontFamily: "TenorSans"),
                cvvCodeDecoration: InputDecoration(
                  hintText: "CVV",
                  hintStyle: TextStyle(fontFamily: "TenorSans"),
                  counterStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                expiryDateTextStyle: TextStyle(fontFamily: "TenorSans"),
                expiryDateDecoration: InputDecoration(
                  hintText: "Expiry Date",
                  hintStyle: TextStyle(fontFamily: "TenorSans"),
                  counterStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const Gap(90),
            CustomButton(
              isicon: false,
              text: 'add card',
              ontap: () {
                if (_key.currentState!.validate()) {
                  final data = {
                    'number': cardNumber,
                    'name': cardHolderName,
                    'date': expiryDate,
                    'cvv': cvvCode,
                  };

                  Navigator.pop(context, data);
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
