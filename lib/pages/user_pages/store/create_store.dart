import 'package:amerixapp/pages/user_pages/store/verify_store.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/button.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../widgets/interests_chips.dart';

class CreateStorePage extends StatelessWidget {
  const CreateStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Setup Store Profile',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: AppColors.AppTheme.withOpacity(.4),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Icon(
                      Feather.camera,
                      color: AppColors.AppTheme,
                      size: 32,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -38,
                  left: 20,
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: AppColors.white,
                    child: CircleAvatar(
                      backgroundColor: AppColors.black.withOpacity(.4),
                      radius: 32,
                      child: const Center(
                        child: Icon(
                          Feather.camera,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const ProfileForm(
              hint: 'Enter store name',
              name: 'Store Name',
            ),
            const ProfileForm(
              hint: 'Describe your store',
              name: 'Description',
            ),
            const ProfileForm(
              hint: 'Enter your stores location',
              name: 'Location',
            ),
            const PhoneContact(name: "Primary Phone Number", hint: ""),
            const ProfileForm(
              hint: 'Enter website url',
              name: 'Website',
            ),
          ],
        ),
        //
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        child: ButtonWidget(
            info: "Next",
            onClick: () {
              Get.to(() => const VerifyStorePage(),
                  transition: Transition.cupertino);
            }),
      ),
    );
  }

  //Flash Bar
  Flushbar<dynamic> flashBar(
    Color color,
    String title,
    String subtitle,
    Icon icon,
  ) {
    return Flushbar(
      margin: const EdgeInsets.all(16),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(8),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundGradient: LinearGradient(colors: [
        color,
        color,
      ]),
      isDismissible: false,
      duration: const Duration(seconds: 4),
      icon: icon,
      titleText: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14.0,
            color: Colors.white,
            fontFamily: "Turing"),
      ),
      messageText: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 12.0, color: Colors.white, fontFamily: "Turing"),
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  final String name;
  final String hint;
  const ProfileForm({
    Key? key,
    required this.name,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          TextField(
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            decoration: InputDecoration(hintText: hint),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

//
class PhoneContact extends StatefulWidget {
  final String name;
  final String hint;
  const PhoneContact({
    Key? key,
    required this.name,
    required this.hint,
  }) : super(key: key);

  @override
  State<PhoneContact> createState() => _PhoneContactState();
}

class _PhoneContactState extends State<PhoneContact> {
  String? value;
  final numbers = ["+254", "+255", "+265", "+120"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Phone number",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Text(
                "KE",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 50,
                color: Colors.transparent,
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  menuMaxHeight: 300,
                  iconSize: 15,
                  isExpanded: true,
                  elevation: 0,
                  value: value,
                  hint: Text(
                    numbers[0].toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  items: numbers.map(buildItems).toList(),
                  onChanged: (value) => setState(() {
                    this.value = value;
                  }),
                )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 15,
                  child: const TextField(
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildItems(String e) {
    return DropdownMenuItem(
        value: e,
        child: Text(
          e,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.black),
        ));
  }
}

//

