import 'package:bhootfashion/component/custom_AppBar.dart';
import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:bhootfashion/models/cover_model.dart';
import 'package:bhootfashion/models/product_model.dart';
import 'package:bhootfashion/screens/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const CustomAppbar(
        isBlackk: true,
      ),
      body: Stack(children: [
        Positioned(
            left: 50,
            right: 50,
            child: SvgPicture.asset('assets/texts/10.svg')),
        Positioned(
            top: 90,
            left: 50,
            right: 50,
            child: SvgPicture.asset('assets/texts/Collection.svg')),
        Positioned(
            top: 40,
            left: 50,
            right: 50,
            child: SvgPicture.asset('assets/texts/October.svg')),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    const Gap(120),
                    Image.asset('assets/cover/cover1.png'),
                    const Gap(20),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ProductModel.product.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.550,
                      ),
                      itemBuilder: (context, index) {
                        final product = ProductModel.product[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOut(
                                      image: product.image,
                                      title: product.name,
                                      disc: product.disc,
                                      price: product.price),
                                ));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(product.image),
                                  const Positioned(
                                    bottom: 7,
                                    right: 10,
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Color(0xffDD8560),
                                    ),
                                  )
                                ],
                              ),
                              const Gap(7),
                              CustomText(
                                text: product.name,
                                weight: FontWeight.w400,
                              ),
                              const Gap(7),
                              CustomText(
                                text: product.disc,
                                color: Colors.grey,
                              ),
                              const Gap(7),
                              CustomText(
                                text: '\$${product.price.toString()}',
                                color: Colors.red.shade200,
                                size: 20,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const Gap(25),
                    CustomText(
                      text: 'You may also like'.toUpperCase(),
                      spacing: 5,
                      size: 20,
                    ),
                    const Gap(13),
                    Image.asset(
                      'assets/svgs/line.png',
                      width: 180,
                    ),
                    const Gap(27),
                    SizedBox(
                      height: 480,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: CoverModel.cover.length,
                        itemBuilder: (context, index) {
                          final cover = CoverModel.cover[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  cover.image,
                                  height: 350,
                                ),
                                const Gap(20),
                                CustomText(
                                  text: cover.name.toUpperCase(),
                                  spacing: 5,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 370,
                decoration: BoxDecoration(color: AppColors.primary),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launchURL(
                                "https://www.facebook.com/share/1Cnkr19KHN/");
                          },
                          child: const Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchURL(
                                "https://www.instagram.com/mohamed_bhoot");
                          },
                          child: const Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchURL(
                                "https://www.linkedin.com/in/mohamed-bhoot-2a956332b");
                          },
                          child: const Icon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Image.asset(
                      'assets/svgs/line.png',
                      color: Colors.grey,
                      width: 220,
                    ),
                    const Gap(25),
                    GestureDetector(
                      onTap: () {
                        launchURL("mailto:mohamedbhoot8@gmail.com");
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.envelope,
                            color: Colors.white,
                          ),
                          CustomText(
                            text: 'mohamedbhoot8@gmail.com ',
                          )
                        ],
                      ),
                    ),
                    const Gap(15),
                    GestureDetector(
                      onTap: () {
                        launchURL("https://wa.me/201061679801");
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                          ),
                          CustomText(
                            text: '01061679801',
                          )
                        ],
                      ),
                    ),
                    const Gap(15),
                    const CustomText(
                      text: '08:00 - 22:00 - Everyday',
                    ),
                    const Gap(25),
                    Image.asset(
                      'assets/svgs/line.png',
                      color: Colors.grey,
                      width: 220,
                    ),
                    const Gap(35),
                    const CustomText(
                      text: 'About       Contact       BLog',
                      weight: FontWeight.w500,
                    ),
                    const Gap(35),
                    Container(
                      width: double.infinity,
                      height: 45,
                      color: Colors.grey[850],
                      child: const Center(
                        child: CustomText(
                            text: 'Copyright© Bhoot All Rights Reserved.'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
