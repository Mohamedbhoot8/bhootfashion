
import 'package:bhootfashion/core/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'custom_text.dart';

class CustomDailog extends StatelessWidget {
  const CustomDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.clear),
              ),
              onTap: () => Navigator.pop(context),
            ),
            const Gap(20),
            CustomText(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
              size: 19,
            ),
            const Gap(30),
            SvgPicture.asset("assets/pop/done.svg", width: 60),
            const Gap(20),
            CustomText(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
              size: 19,
            ),
            const Gap(20),
            CustomText(
              text: "Payment ID 15263541".toUpperCase(),
              color: Colors.black,
              size: 14,
            ),
            const Gap(20),
            Image.asset("assets/svgs/line.png",
                color: Colors.black, width: 120),
            const Gap(20),
            CustomText(
              text: "Rate your purchase".toUpperCase(),
              color: Colors.black,
              size: 19,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/pop/emogi1.svg"),
                const Gap(20),
                SvgPicture.asset("assets/pop/emogi2.svg"),
                const Gap(20),
                SvgPicture.asset("assets/pop/emogi3.svg"),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(color: AppColors.primary),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'submit'.toUpperCase(),
                            fontfamily: 'TenorSans',
                            weight: FontWeight.w500,
                            size: 18,
                            spacing: 1,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
                const Gap(20),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(color: AppColors.primary),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'cancel'.toUpperCase(),
                            fontfamily: 'TenorSans',
                            weight: FontWeight.w500,
                            size: 18,
                            spacing: 1,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
