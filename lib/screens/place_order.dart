import 'package:bhootfashion/component/addressinfo.dart';
import 'package:bhootfashion/component/cart_widget.dart';
import 'package:bhootfashion/component/custom_AppBar.dart';
import 'package:bhootfashion/component/custom_button.dart';
import 'package:bhootfashion/component/custom_dialog.dart';
import 'package:bhootfashion/component/custom_header.dart';
import 'package:bhootfashion/component/custom_text.dart';
import 'package:bhootfashion/component/shipping.dart';
import 'package:bhootfashion/core/color.dart';
import 'package:bhootfashion/screens/add_adress.dart';
import 'package:bhootfashion/screens/add_payment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder(
      {super.key,
      required this.img,
      required this.title,
      required this.disc,
      required this.qty,
      required this.total,
      required this.price});

  final String img, title, disc;
  final int qty, total, price;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;
  dynamic _savedCard;
  late int selectedQty;

  @override
  void initState() {
    selectedQty = widget.qty;
    super.initState();
  }

  void editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (c) => AddAdress(
                editData: _savedAddress,
              )),
    );

    setState(() {
      _savedAddress = newAddress;
    });
  }

  void openAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => const AddAdress()),
    );

    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void editCard() async {
    final newCard = await Navigator.push(
        context, MaterialPageRoute(builder: (c) => const AddPayment()));
    setState(() {
      _savedCard = newCard;
    });
  }

  void openCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => const AddPayment()),
    );

    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(isBlackk: false),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Gap(15),
          const CustomHeader(text: 'checkout'),
          const Gap(10),
          // sh address
          _savedAddress != null
              ? AddressInfo(
                  savedAddress: _savedAddress,
                  onTap: () => editAddress(),
                )
              : Shipping(
                  ontap: () => openAddress(context),
                  text: 'Add shipping adress',
                  img: 'assets/svgs/plus.svg',
                  isfree: false,
                  textoflabel: 'shipping adress'),
          _savedAddress == null ? const Gap(35) : const SizedBox.shrink(),

          // sh method
          _savedAddress != null && _savedCard != null
              ? const SizedBox.shrink()
              : const Shipping(
                  text: 'Pickup at store',
                  img: 'assets/svgs/arrow.svg',
                  isfree: true,
                  textoflabel: 'shipping method'),
          _savedCard == null ? const Gap(35) : const SizedBox.shrink(),
          // payment method
          _savedCard != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Divider(color: Colors.grey.shade300),
                      const Gap(20),
                      GestureDetector(
                        onTap: () {
                          editCard();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/svgs/Mastercard.svg",
                                width: 40),
                            const Gap(10),
                            const CustomText(
                                text: "Master Card ending",
                                color: Colors.black),
                            const Gap(10),
                            CustomText(
                              text:
                                  "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                              color: Colors.black,
                            ),
                            const Spacer(),
                            SvgPicture.asset("assets/svgs/arrow.svg"),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Divider(color: Colors.grey.shade300),
                      const Gap(10),
                      CartWidget(
                        title: widget.title,
                        disc: widget.disc,
                        img: widget.img,
                        price: widget.price,
                        qty: widget.qty,
                        onChanged: (qty) => setState(() {
                          selectedQty = qty;
                        }),
                      )
                    ],
                  ),
                )
              : Shipping(
                  ontap: () => openCard(),
                  text: 'select payment method',
                  img: 'assets/svgs/arrow.svg',
                  isfree: false,
                  textoflabel: 'payment method'),

          //////////////////////////
          const Spacer(),
          Row(
            children: [
              const Gap(15),
              CustomText(
                text: 'Total'.toUpperCase(),
                color: AppColors.primary,
                weight: FontWeight.w400,
                fontfamily: 'TenorSans',
                spacing: 3,
              ),
              const Spacer(),
              CustomText(
                text: '\$${widget.price * selectedQty}',
                color: Colors.red.shade200,
                weight: FontWeight.w400,
                fontfamily: 'TenorSans',
                size: 25,
              ),
              const Gap(15),
            ],
          ),
          const Gap(35),
          CustomButton(
            isicon: true,
            text: 'PLACE order',
            ontap: () {
              if (_savedAddress == null || _savedCard == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Please add address and payment method first.')),
                );
                return;
              }
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Dialog(
                  child: CustomDailog(),
                ),
              );
            },
          ),
          const Gap(12),
        ],
      ),
    );
  }
}
