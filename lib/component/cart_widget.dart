import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartWidget extends StatefulWidget {
  const CartWidget(
      {super.key,
      required this.title,
      required this.disc,
      required this.img,
      required this.price,
      required this.qty,
      required this.onChanged});

  final String title, disc, img;
  final int price;
  final int qty;
  final Function(int) onChanged;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late int number;

  @override
  void initState() {
    number = 1;
    number = widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          width: 120,
          height: 160,
          widget.img,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            CustomText(
              text: widget.title.toUpperCase(),
              weight: FontWeight.w400,
              spacing: 1,
              color: AppColors.primary,
            ),
            const Gap(20),
            CustomText(
                text: widget.disc.toUpperCase(),
                spacing: 2,
                size: 13,
                weight: FontWeight.w400,
                color: const Color(0xff555555)),
            const Gap(20),
            Row(
              children: [
                qty('assets/svgs/min.svg', () {
                  setState(() {
                    if (number <= 1) {
                      return;
                    } else {
                      number--;
                      widget.onChanged(number);
                    }
                  });
                }),
                const Gap(20),
                CustomText(
                  text: number.toString(),
                  color: AppColors.primary,
                  weight: FontWeight.bold,
                ),
                const Gap(20),
                qty('assets/svgs/plus.svg', () {
                  setState(() {
                    number++;
                    widget.onChanged(number);
                  });
                })
              ],
            ),
            const Gap(25),
            CustomText(
              text: ' \$ ${widget.price.toString()}',
              color: Colors.red.shade200,
              size: 22,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ],
    );
  }
}

Widget qty(svg, ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(svg),
    ),
  );
}
