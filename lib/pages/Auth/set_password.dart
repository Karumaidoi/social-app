// ignore_for_file: valid_regexps, use_build_context_synchronously

import 'dart:convert';
import 'package:amerixapp/widgets/amerix_icon.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:amerixapp/pages/Auth/success_reset.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SetPassword extends StatefulWidget {
  final String token;

  const SetPassword({Key? key, required this.token}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool isHidden = true;
  bool isHidden2 = true;
  bool showError = false;
  bool isSubmitting = false;
  String password = '';
  String confirmPassword = '';
  String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AmerixIcon(),
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    "Create your password",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text:
                          'Strong passwords must include numbers, letters, and special characters.',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Turing',
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1, color: AppColors.grey.withOpacity(.2))),
                      child: Center(
                        child: TextFormField(
                          obscureText: !isHidden,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                              showError = false;
                            });
                          },
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isHidden = !isHidden;
                                    });
                                  },
                                  icon: isHidden
                                      ? const Icon(
                                          Feather.eye_off,
                                          size: 21,
                                        )
                                      : const Icon(
                                          Feather.eye,
                                          size: 21,
                                        )),
                              hintStyle: const TextStyle(fontSize: 13),
                              hintText: 'Enter your password',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    showError == true
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                error!,
                                style: TextStyle(
                                    fontSize: 9,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1, color: AppColors.grey.withOpacity(.2))),
                      child: Center(
                        child: TextFormField(
                          obscureText: !isHidden2,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() {
                              confirmPassword = value;
                            });
                          },
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isHidden2 = !isHidden2;
                                    });
                                  },
                                  icon: isHidden2
                                      ? const Icon(Feather.eye_off, size: 21)
                                      : const Icon(Feather.eye, size: 21)),
                              hintStyle: const TextStyle(fontSize: 13),
                              hintText: 'Repeat password',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    showError == true
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                error!,
                                style: TextStyle(
                                    fontSize: 9,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),

                const SizedBox(
                  height: 65,
                ),

                //
                password == '' || confirmPassword == ''
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        height: 45,
                        decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(
                                width: 1,
                                color: AppColors.grey.withOpacity(.2))),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          if (password.length < 8 || password.length < 8) {
                            setState(() {
                              showError = true;
                              error =
                                  'Password can only have atleat 8 characters';
                            });
                          }
                          if (password == '' || confirmPassword == '') {
                            setState(() {
                              showError = true;
                              error = 'Password cannot be empty';
                            });
                          } else if (password != confirmPassword) {
                            setState(() {
                              showError = true;
                              error = 'Password does not match';
                            });
                          } else if (password.length > 20 ||
                              confirmPassword.length > 20) {
                            setState(() {
                              showError = true;
                              error =
                                  'Password can only have a maximum of 20 characters';
                            });
                          }
                          var res =
                              await createPassword(password, confirmPassword);

                          if (res.statusCode == 201) {
                            Get.to(
                                () => SuccessScreen(
                                      token: widget.token,
                                    ),
                                transition: Transition.cupertino);
                          } else {
                            setState(() {
                              isSubmitting = false;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(200),
                              border: Border.all(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(.2))),
                          child: Center(
                            child: isSubmitting == true
                                ? const SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ))
                                : Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
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

  //
  Future<http.Response> createPassword(
      String passWord, String confirmPassword) async {
    setState(() {
      isSubmitting = true;
    });
    var info = await http.post(
        Uri.parse("http://159.89.16.24/api/v2/auth/reset-password"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer ${widget.token}",
        },
        body: jsonEncode(<String, String>{
          'password': passWord,
          'password_confirmation': confirmPassword,
        }));
    // var token = info.body.split('api_token":"')[1];
    // var newToken = token.split('",')[0];

    if (info.statusCode != 201) {
      setState(() {
        isSubmitting = true;
      });
      setState(() {
        showError = true;
        error = 'Please enter a strong password';
      });
    } else {
      setState(() {
        showError = false;
      });
    }
    print(info.body);
    return info;
  }
}
