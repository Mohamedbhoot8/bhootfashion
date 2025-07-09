import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Shipping extends StatelessWidget {
  const Shipping(
      {super.key,
      required this.text,
      required this.img,
      required this.isfree,
      required this.textoflabel,
      this.ontap});
  final String text, img, textoflabel;
  final bool isfree;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: textoflabel.toUpperCase(),
              spacing: 3,
              weight: FontWeight.w500,
              size: 16,
              color: AppColors.primary,
            ),
            const Gap(15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                  color: const Color.fromARGB(255, 236, 232, 232)),
              child: Row(
                children: [
                  const Gap(10),
                  CustomText(
                    text: text,
                    spacing: 3,
                    weight: FontWeight.w500,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  const Spacer(),
                  isfree
                      ? CustomText(
                          text: 'Free  ',
                          spacing: 3,
                          weight: FontWeight.w500,
                          size: 16,
                          color: AppColors.primary,
                        )
                      : const SizedBox.shrink(),
                  SvgPicture.asset(
                    img,
                    width: 25,
                    height: 25,
                  ),
                  const Gap(25),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
