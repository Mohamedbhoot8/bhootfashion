import 'package:bhootfashion/component/custom_AppBar.dart';
import 'package:bhootfashion/component/custom_button.dart';
import 'package:bhootfashion/component/custom_form_feild.dart';
import 'package:bhootfashion/component/custom_header.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key, this.editData});
  final dynamic editData;

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController adress = TextEditingController();

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    city.dispose();
    state.dispose();
    zipcode.dispose();
    phone.dispose();
    adress.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.editData != null) {
      fname.text = widget.editData['first'] ?? '';
      lname.text = widget.editData['last'] ?? '';
      adress.text = widget.editData['address'] ?? '';
      city.text = widget.editData['city'] ?? '';
      state.text = widget.editData['state'] ?? '';
      zipcode.text = widget.editData['zip'] ?? '';
      phone.text = widget.editData['phone'] ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppbar(isBlackk: false),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      const Gap(15),
                      const CustomHeader(text: 'add shipping adress'),
                      const Gap(30),
                      Form(
                          key: formstate,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: CustomTextField(
                                            label: 'First name',
                                            controller: fname)),
                                    const Gap(16),
                                    Expanded(
                                        child: CustomTextField(
                                            label: 'Last name',
                                            controller: lname))
                                  ],
                                ),
                                const Gap(30),
                                CustomTextField(
                                    label: 'Adress', controller: adress),
                                const Gap(30),
                                CustomTextField(
                                    label: 'City', controller: city),
                                const Gap(30),
                                Row(
                                  children: [
                                    Expanded(
                                        child: CustomTextField(
                                            label: 'State', controller: state)),
                                    const Gap(16),
                                    Expanded(
                                        child: CustomTextField(
                                            label: 'Zip code',
                                            controller: zipcode)),
                                  ],
                                ),
                                const Gap(30),
                                CustomTextField(
                                    label: 'Phone number', controller: phone),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      const Gap(143),
                      CustomButton(
                          ontap: () {
                            if (formstate.currentState!.validate()) {
                              return;
                            } else {
                              final data = {
                                'first': fname.text,
                                'last': lname.text,
                                'address': adress.text,
                                'Zip': zipcode.text,
                                'city': city.text,
                                'phone': phone.text,
                              };
                              Navigator.pop(context, data);
                            }
                          },
                          isicon: false,
                          text: 'add adress'),
                      const Gap(15)
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
