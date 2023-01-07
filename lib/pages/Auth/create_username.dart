// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amerixapp/pages/Auth/create_password.dart';
import 'package:amerixapp/pages/Auth/reset_password.dart';
import 'package:amerixapp/pages/Auth/set_password.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../widgets/amerix_icon.dart';
import '../../widgets/button.dart';

class CreateUsername extends StatefulWidget {
  final String? token;
  const CreateUsername({Key? key, required this.token}) : super(key: key);

  @override
  State<CreateUsername> createState() => _CreateUsernameState();
}

class _CreateUsernameState extends State<CreateUsername> {
  String userName = '';
  bool showError = false;
  bool showNext = true;
  String? userToken;
  bool? showSuffix;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25, right: 25, left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AmerixIcon(),
                const SizedBox(
                  height: 52,
                ),
                const Center(
                  child: Text(
                    "Create username",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'You can always change it later',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Turing',
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) {
                    userName = value;
                    showError = false;
                    if (value.length >= 4 && value.length < 20) {
                      setState(() {
                        showSuffix = true;
                      });
                    } else {
                      setState(() {
                        showSuffix = false;
                      });
                    }
                  },
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(),
                    hintStyle: const TextStyle(fontSize: 13),
                    suffixIcon: showSuffix == true
                        ? Icon(
                            Icons.check_circle,
                            color: AppColors.AppTheme,
                            size: 19,
                          )
                        : null,
                    hintText: '',
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                showError == true
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Wrong username. Please try again.',
                            style: TextStyle(
                                fontSize: 9,
                                color: AppColors.red,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : const SizedBox(),

                //
                const SizedBox(
                  height: 175,
                ),
                showSuffix == true
                    ? ButtonWidget(
                        info: "Continue",
                        onClick: () async {
                          if (userName == '' ||
                              userName.length > 20 ||
                              userName.length < 4) {
                            setState(() {
                              showError = true;
                            });
                            return;
                          }

                          await createName(userName);

                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('username', userName);
                          //
                          Toast.show("Username created successfully",
                              duration: 3,
                              gravity: Toast.bottom,
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Colors.white));
                          Get.to(() => CreatePassword(BearerToken: userToken!),
                              transition: Transition.cupertino);
                        })
                    : GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 45,
                          decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(.4),
                              borderRadius: BorderRadius.circular(500),
                              border: Border.all(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(.2))),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
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

  //
  Future<http.Response> createName(
    String userName,
  ) async {
    var info = await http.post(
        Uri.parse("http://159.89.16.24/api/v2/auth/set-username"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer ${widget.token}",
        },
        body: jsonEncode(<String, String>{
          'username': userName,
        }));
    var token = info.body.split('api_token":"')[1];
    var newToken = token.split('",')[0];

    if (info.statusCode != 201) {
      setState(() {
        showError = true;
      });
    } else {
      setState(() {
        showNext = true;
        userToken = newToken;
      });
    }

    return info;
  }
}
