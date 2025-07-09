import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.isicon, this.ontap, required this.text});

  final bool isicon;
  final void Function()? ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(color: AppColors.primary),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isicon
                  ? SvgPicture.asset('assets/svgs/shopping bag.svg')
                  : const SizedBox.shrink(),
              const Gap(20),
              CustomText(
                text: text.toUpperCase(),
                fontfamily: 'TenorSans',
                weight: FontWeight.w500,
                size: 18,
                spacing: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
