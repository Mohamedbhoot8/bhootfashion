import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomText(
            text: text.toUpperCase(),
            color: AppColors.primary,
            fontfamily: 'TenorSans',
            weight: FontWeight.w400,
            size: 25,
            spacing: 4,
          ),
        ),
        const Gap(7),
        Image.asset(
          'assets/svgs/line.png',
          width: 180,
          color: Colors.black,
        ),
        const Gap(18),
      ],
    );
  }
}
