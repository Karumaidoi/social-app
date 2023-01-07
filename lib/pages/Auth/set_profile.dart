import 'dart:io';

import 'package:amerixapp/pages/Auth/follow_page.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/amerix_icon.dart';
import 'package:amerixapp/widgets/button.dart';
import 'package:amerixapp/widgets/rich_text.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userService.dart';

class Setprofile extends StatefulWidget {
  final String bearerToken;
  const Setprofile({Key? key, required this.bearerToken}) : super(key: key);

  @override
  State<Setprofile> createState() => _SetprofileState();
}

class _SetprofileState extends State<Setprofile> {
  String? value;
  String valued = '';
  bool changeState = false;
  File? image;
  bool error = false;
  bool isSubmitting = false;
  static const values = <String>['Man', 'Woman'];
  String _verticalGroupValue = "";
  String codeCountry = '';
  final countryPicker = const FlCountryCodePicker();
  final List<String> _status = [
    "Man",
    "Woman",
  ];
  String selectedValue = values.first;
  String? sex;
  String phoneNumber = '';
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AmerixIcon(),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: AppColors.AppTheme.withOpacity(0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        showOptionsDialog(context);
                      },
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: image == null
                            ? const Center(
                                child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image(
                                  image: FileImage(image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                  //
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  error == true
                      ? RichText(
                          text: TextSpan(
                            text: 'Phone number',
                            style: TextStyle(
                                fontSize: 11,
                                color: AppColors.red,
                                fontFamily: 'Turing',
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: 'Turing',
                                    color: AppColors.red,
                                  )),
                            ],
                          ),
                        )
                      : const RichTextWidget(label: 'Phone number'),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(
                        "KE",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final code =
                              await countryPicker.showPicker(context: context);
                          if (code != null) {
                            setState(() {
                              codeCountry = code.dialCode.toString();
                              value = code.dialCode.split('+')[1].toString();
                              print(value);
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              color: AppColors.AppTheme,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0))),
                          child: Text(codeCountry,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 15,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(),
                            ),
                            style: const TextStyle(fontSize: 15),
                            onChanged: (valued) {
                              setState(() {
                                phoneNumber = (value! + valued);
                                print(phoneNumber);
                                error = false;
                              });
                            },
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RichTextWidget(label: 'Sex'),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      RadioGroup<String>.builder(
                        direction: Axis.horizontal,
                        groupValue: _verticalGroupValue,
                        onChanged: (value) => setState(() {
                          _verticalGroupValue = value!;
                        }),
                        items: _status,
                        itemBuilder: (item) => RadioButtonBuilder(
                          item,
                          textPosition: RadioButtonTextPosition.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //
            phoneNumber.length < 8
                ? Container(
                    margin: const EdgeInsets.all(15),
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(.6),
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                            width: 1, color: AppColors.grey.withOpacity(.2))),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13),
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.all(15),
                    child: ButtonWidget(
                        info: "Continue",
                        onClick: () async {
                          //
                          var res = await UserServive.uploadInfo(
                              '+$phoneNumber',
                              _verticalGroupValue,
                              widget.bearerToken);

                          print(res.body);

                          if (res.statusCode == 200) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('token', widget.bearerToken);
                            Get.to(
                                () => FollowPage(
                                      BearerToken: widget.bearerToken,
                                    ),
                                transition: Transition.cupertino);
                          }

                          var err = res.body.split('message":"')[1];
                          // ignore: non_constant_identifier_names
                          var AppError = err.split('"}')[0];

                          //
                          if (AppError.contains(
                              'The phonenumber has already been taken')) {
                            setState(() {
                              error = true;
                            });
                          }
                        }),
                  ),
          ],
        ),
      ),
      // ignore: unrelated_type_equality_checks
    );
  }

  //
  pickImage(ImageSource src) async {
    Navigator.of(context).pop();
    final imageS = await ImagePicker().pickImage(
        source: src,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    if (imageS == null) return;

    final imageTemporary = File(imageS.path);
    setState(() {
      image = imageTemporary;
    });

    await UserServive.uploadImage(imageTemporary, widget.bearerToken);
  }

  //
  Future showOptionsDialog(context) {
    return showCupertinoDialog(
        barrierDismissible: true,
        barrierLabel: "Choose to pick",
        context: context,
        builder: (context) {
          return SimpleDialog(
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Turing"),
            title: const Center(
                child: Text(
              "Choose to pick an image",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: "Turing"),
            )),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                child: const Center(
                    child: Text(
                  "Gallery",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "Turing"),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                child: const Center(
                    child: Text(
                  "Camera",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "Turing"),
                )),
              )
            ],
          );
        });
  }
}
