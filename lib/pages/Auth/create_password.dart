// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../widgets/amerix_icon.dart';
import 'sign_up_sucess.dart';

class CreatePassword extends StatefulWidget {
  final String BearerToken;
  const CreatePassword({Key? key, required this.BearerToken}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  String userName = '';
  bool isHidden = true;
  bool isHidden2 = true;
  bool showError = true;
  String? password;
  String? confirmPassword;
  bool showNext = true;
  bool isSubmitting = false;
  String userToken = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AmerixIcon(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      "Create Password",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        obscureText: isHidden,
                        onChanged: (value) {
                          setState(() {
                            error = '';
                            password = value;
                          });
                        },
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          errorBorder: const UnderlineInputBorder(),
                          suffix: IconButton(
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
                          errorText: error,
                          hintStyle: const TextStyle(fontSize: 13),
                          hintText: '',
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Create Password',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),

                  //
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            error = '';
                            confirmPassword = value;
                          });
                        },
                        obscureText: isHidden2,
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          errorBorder: const UnderlineInputBorder(),
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  isHidden2 = !isHidden2;
                                });
                              },
                              icon: isHidden2
                                  ? const Icon(
                                      Feather.eye_off,
                                      size: 21,
                                    )
                                  : const Icon(
                                      Feather.eye,
                                      size: 21,
                                    )),
                          errorText: error,
                          hintStyle: const TextStyle(fontSize: 13),
                          hintText: '',
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Confirm Password',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Your password must have:',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline_rounded,
                              color: AppColors.AppTheme,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '8 to 20 characters',
                              style: TextStyle(
                                  color: AppColors.AppTheme, fontSize: 12),
                            )
                          ],
                        ),
                      ),

                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline_rounded,
                              color: AppColors.AppTheme,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Letters, numbers and special characters',
                              style: TextStyle(
                                  color: AppColors.AppTheme, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () async {
                  if (password == '' || confirmPassword == '') {
                    setState(() {
                      error = 'Password cannot be empty';
                    });
                  }

                  //
                  if (password!.length < 8 || confirmPassword!.length < 8) {
                    setState(() {
                      isSubmitting = false;
                      error = 'Password must have at least 8 characters';
                    });
                  }

                  //
                  if (password!.length > 20 || confirmPassword!.length > 20) {
                    setState(() {
                      isSubmitting = false;
                      error = 'Password can have a maximum of 20 characters';
                    });
                  }

                  var res = await createPassword(password!, confirmPassword!);

                  if (res.statusCode == 201) {
                    setState(() {
                      isSubmitting = false;
                    });
                    Get.to(
                        () => SignUpScreenSucess(
                              BearerToken: userToken,
                            ),
                        transition: Transition.cupertino);
                  } else {
                    setState(() {
                      isSubmitting = false;
                    });

                    var err = res.body.split('message":"')[1];
                    // ignore: non_constant_identifier_names
                    var AppError = err.split('"}')[0];
                    // ignore:
                    if (AppError.contains('The password format is invalid')) {
                      setState(() {
                        error = 'The password format is invalid';
                      });
                    } else if (AppError.contains(
                        'Password must have at least 8 characters')) {
                      setState(() {
                        error = 'Password must have at least 8 characters';
                      });
                    } else if (AppError.contains(
                        'Password can have a maximum of 20 characters')) {
                      setState(() {
                        error = 'Password can have a maximum of 20 characters';
                      });
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(15),
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(
                          width: 1, color: AppColors.grey.withOpacity(.2))),
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
        ),
      ),
    );
  }

  //
  Future<http.Response> createPassword(
      String passWord, String confirmPassword) async {
    try {
      var info = await http.post(
          Uri.parse("http://159.89.16.24/api/v2/auth/set-password"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': "Bearer ${widget.BearerToken}",
          },
          body: jsonEncode(<String, String>{
            'password': passWord,
            'password_confirmation': confirmPassword,
          }));
      var token = info.body.split('api_token":"')[1];
      var newToken = token.split('",')[0];
      print(newToken);

      setState(() {
        userToken = newToken;
      });

      if (info.statusCode != 201) {
        setState(() {
          isSubmitting = false;
        });
        setState(() {
          showError = true;
          error = 'Please enter a strong password';
        });
      } else {
        setState(() {
          showError = false;
          isSubmitting = true;
        });
      }
      return info;
    } catch (err) {
      setState(() {
        showError = false;
      });
      throw Exception(err);
    }
  }
}
