import 'package:bhootfashion/component/cart_widget.dart';
import 'package:bhootfashion/component/custom_AppBar.dart';
import 'package:bhootfashion/component/custom_button.dart';
import 'package:bhootfashion/component/custom_header.dart';
import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:bhootfashion/screens/place_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({
    super.key,
    required this.image,
    required this.title,
    required this.disc,
    required this.price,
  });
  final String image, title, disc;
  final int price;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectedqty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(isBlackk: false),
      body: Column(
        children: [
          const Gap(15),
          const CustomHeader(text: 'checkout'),
          CartWidget(
            title: widget.title,
            disc: widget.disc,
            img: widget.image,
            price: widget.price,
            qty: selectedqty,
            onChanged: (v) {
              setState(() {
                selectedqty = v;
              });
            },
          ),
          promoanddelivery(),
          const Spacer(),
          Row(
            children: [
              const Gap(15),
              CustomText(
                text: 'Est. Total'.toUpperCase(),
                color: AppColors.primary,
                weight: FontWeight.w400,
                fontfamily: 'TenorSans',
                spacing: 3,
              ),
              const Spacer(),
              CustomText(
                text: '\$${widget.price * selectedqty}',
                color: Colors.red.shade200,
                weight: FontWeight.w400,
                fontfamily: 'TenorSans',
                size: 25,
              ),
              const Gap(15),
            ],
          ),
          const Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomButton(
              isicon: true,
              text: 'checkout',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlaceOrder(
                            img: widget.image,
                            title: widget.title,
                            disc: widget.disc,
                            qty: selectedqty,
                            total: widget.price * selectedqty,
                            price: widget.price)));
              },
            ),
          ),
          const Gap(15),
        ],
      ),
    );
  }
}

Widget promoanddelivery() {
  return Column(
    children: [
      const Gap(25),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Divider(),
            const Gap(15),
            Row(
              children: [
                const Gap(25),
                SvgPicture.asset(
                  'assets/svgs/promo.svg',
                  height: 30,
                ),
                const Gap(25),
                CustomText(
                  text: 'Add Promo Code',
                  fontfamily: 'TenorSan',
                  color: AppColors.primary,
                  weight: FontWeight.w400,
                )
              ],
            ),
            const Gap(15),
            const Divider(),
            const Gap(15),
            Row(
              children: [
                const Gap(25),
                SvgPicture.asset(
                  'assets/svgs/delivery.svg',
                  height: 30,
                ),
                const Gap(25),
                CustomText(
                  text: '    Delivery',
                  fontfamily: 'TenorSan',
                  weight: FontWeight.w400,
                  color: AppColors.primary,
                ),
                const Spacer(),
                CustomText(
                  text: 'Free',
                  fontfamily: 'TenorSan',
                  weight: FontWeight.w400,
                  color: AppColors.primary,
                ),
                const Gap(25),
              ],
            ),
            const Gap(15),
            const Divider(),
          ],
        ),
      ),
    ],
  );
}
