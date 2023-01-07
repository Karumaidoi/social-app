import 'dart:io';

import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/button.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../../model/userService.dart';
import '../../../widgets/interests_chips.dart';
import '../../../widgets/rich_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool error = false;
  String? value;
  bool isSubmitting = false;
  String codeCountry = '';
  final countryPicker = const FlCountryCodePicker();
  String name = '';
  String bio = '';
  String phoneNumber = '';
  String websiteUrl = '';
  File? image;
  File? backImage;
  static const values = <String>['Man', 'Woman'];
  String _verticalGroupValue = "";
  final List<String> _status = [
    "Man",
    "Woman",
  ];
  String selectedValue = values.first;
  String? sex;
  final inputFormat = DateFormat('dd/MM/yyyy');
  DateTime selectedDate = DateTime.now();
  String? newDate;
  bool errorDate = false;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
                GestureDetector(
                  onTap: () {
                    showOptionsDialogBack(context);
                  },
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        color: AppColors.AppTheme.withOpacity(.4),
                        image: backImage == null
                            ? null
                            : DecorationImage(
                                image: FileImage(backImage!),
                                fit: BoxFit.cover)),
                    width: MediaQuery.of(context).size.width,
                    child: backImage == null
                        ? Center(
                            child: Icon(
                              Feather.camera,
                              color: AppColors.AppTheme,
                              size: 32,
                            ),
                          )
                        : null,
                  ),
                ),
                Positioned(
                  bottom: -38,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      showOptionsDialog(context);
                    },
                    child: CircleAvatar(
                      radius: 38,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        backgroundColor: AppColors.black.withOpacity(.4),
                        backgroundImage:
                            image == null ? null : FileImage(image!),
                        radius: 32,
                        child: image == null
                            ? const Center(
                                child: Icon(
                                  Feather.camera,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Full name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(hintText: ''),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Date of Birth',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  TextField(
                    onChanged: (value) {},
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            var datePicked =
                                await DatePicker.showSimpleDatePicker(
                              context,
                              confirmText: 'Ok',
                              textColor: AppColors.AppTheme,
                              itemTextStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                              titleText: '',
                              initialDate: DateTime(2022),
                              firstDate: DateTime(1960),
                              lastDate: DateTime(2022, 8),
                              dateFormat: "dd-MMMM-yyyy",
                              locale: DateTimePickerLocale.en_us,
                              looping: true,
                            );

                            setState(() {
                              selectedDate = datePicked!;
                              errorDate = false;
                            });

                            //
                            changeDate(selectedDate);
                          },
                          child: Icon(Icons.date_range,
                              color: AppColors.AppTheme)),
                      hintText: newDate == null
                          ? ''
                          : newDate.toString().split(' ')[0],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Bio',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        bio = value;
                      });
                    },
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                      hintText: '',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
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
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '',
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
                      SizedBox(
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
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Website',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        websiteUrl = value;
                      });
                    },
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                      hintText: '',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
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
          ],
        ),
        //
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        child: ButtonWidget(
            info: "Save",
            onClick: () async {
              var token = await token_read();
              await UserServive.updateUserInfo(phoneNumber, _verticalGroupValue,
                  token, name, websiteUrl, bio, selectedDate);

              //
              Toast.show("Updated successfully",
                  duration: 3,
                  gravity: Toast.bottom,
                  textStyle:
                      const TextStyle(fontSize: 14, color: Colors.white));
              Navigator.of(context).pop();
            }),
      ),
    );
  }

  //
  pickImageBack(ImageSource src) async {
    Navigator.of(context).pop();
    final imageS = await ImagePicker().pickImage(
        source: src,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    if (imageS == null) return;

    final imageTemporary = File(imageS.path);
    setState(() {
      backImage = imageTemporary;
    });

    var token = await token_read();

    await UserServive.uploadImageBack(imageTemporary, token);
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

    var token = await token_read();

    await UserServive.uploadImage(imageTemporary, token);
  }

  //
  //
  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'token';
    var read_value = prefs.getString(key) ?? 0;

    return read_value;
  }

  //
  userName_read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'username';
    var read_value = prefs.getString(key) ?? 0;
    return read_value.toString();
  }

  //
  Future showOptionsDialogBack(context) {
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
                  pickImageBack(ImageSource.gallery);
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
                  pickImageBack(ImageSource.camera);
                },
                child: const Center(
                    child: Text(
                  "Camera",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "Lato"),
                )),
              )
            ],
          );
        });
  }

  //
  changeDate(DateTime date) {
    String formattedDate = DateFormat('dd-MM-yyyy - kk:mm').format(date);
    setState(() {
      newDate = formattedDate;
    });
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
                      fontFamily: "Lato"),
                )),
              )
            ],
          );
        });
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

