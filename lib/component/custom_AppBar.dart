// ignore_for_file: file_names, deprecated_member_use

import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlackk});
  final bool isBlackk;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    bool isBlack = isBlackk;

    return AppBar(
        backgroundColor: isBlack ? AppColors.primary : Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(
            'assets/svgs/Menu.svg',
            color: isBlack ? Colors.white : AppColors.primary,
          ),
        ),
        leadingWidth: 45,
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            'assets/svgs/Search.svg',
            color: isBlack ? Colors.white : AppColors.primary,
          ),
          const Gap(10),
          SvgPicture.asset(
            'assets/svgs/shopping bag.svg',
            color: isBlack ? Colors.white : AppColors.primary,
          ),
          const Gap(10),
        ],
        title: Stack(
          children: [
            Positioned(
              child: CustomText(
                text: 'bhoot'.toUpperCase(),
                fontfamily: 'TenorSans',
                weight: FontWeight.w400,
                color: isBlack ? Colors.white : AppColors.primary,
                spacing: 7,
                size: 25,
              ),
            ),
          ],
        ));
  }
}
