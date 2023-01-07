// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amerixapp/model/userService.dart';
import 'package:amerixapp/pages/Auth/forgot_password.dart';
import 'package:amerixapp/pages/Auth/sign_up.dart';
import 'package:amerixapp/pages/Main_Home/main_home.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/apple_btn.dart';
import 'package:amerixapp/widgets/google_btn.dart';
import 'package:amerixapp/widgets/rich_text.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../widgets/amerix_icon.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isShowing = false;
  String email = '';
  String password = '';
  bool errorEmail = false;
  bool errorPassword = false;
  bool isSubmitting = false;
  bool isHidden = false;
  bool setDefault = false;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              color: AppColors.grey,
              size: 19,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AmerixIcon(),
                const SizedBox(height: 15),

                const SizedBox(
                  height: 30,
                ),
                const GoogleBtn(
                  title: 'Log in with Apple',
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppleBtn(
                  title: 'Log in with Apple',
                ),

                //
                const SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      color: AppColors.grey,
                      width: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'or',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.grey,
                      width: 100,
                    ),
                  ],
                ),

                //
                const SizedBox(
                  height: 30,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RichTextWidget(label: 'Email Address'),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: errorEmail == false
                              ? Border.all(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(.2))
                              : Border.all(
                                  width: 2,
                                  color: AppColors.red.withOpacity(.6))),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (!value!.contains('@')) {
                              return 'Please enter a valid Email Address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                            setState(() {
                              errorEmail = false;
                            });
                          },
                          style: const TextStyle(fontSize: 13),
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 13),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    errorEmail == true
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Account not found',
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
                    const RichTextWidget(label: 'Password'),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: errorPassword == false
                              ? Border.all(
                                  width: 1,
                                  color: AppColors.grey.withOpacity(.2))
                              : Border.all(
                                  width: 2,
                                  color: AppColors.red.withOpacity(.6))),
                      child: Center(
                        child: TextFormField(
                          obscureText: !isHidden,
                          onChanged: (value) {
                            if (value.length >= 8) {
                              setState(() {
                                password = value;
                                errorPassword = false;
                                setDefault = true;
                              });
                            } else {
                              setState(() {
                                setDefault = false;
                              });
                            }
                          },
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isHidden = !isHidden;
                                    });
                                  },
                                  icon: !isHidden
                                      ? const Icon(
                                          Feather.eye_off,
                                          size: 21,
                                        )
                                      : const Icon(
                                          Feather.eye,
                                          size: 21,
                                        )),
                              hintStyle: const TextStyle(fontSize: 13),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    errorPassword == true
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Invalid password',
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

                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const ForgotPassword(),
                              transition: Transition.cupertino);
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.AppTheme,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),

                //
                const SizedBox(
                  height: 15,
                ),

                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isSubmitting = true;
                    });

                    //
                    if (email == '' || password == '') {
                      setState(() {
                        isSubmitting = false;
                      });
                    }
                    var res =
                        await UserServive.logIn(email, password, isSubmitting);

                    if (res.statusCode != 201) {
                      setState(() {
                        isSubmitting = false;
                      });
                      //Show notif
                      var err = res.body.split('message":"')[1];
                      // ignore: non_constant_identifier_names
                      var AppError = err.split('",')[0];
                      // Password must have at least 8 characters
                      if (AppError.contains('password') ||
                          AppError.contains(
                              'Password must have at least 8 characters')) {
                        setState(() {
                          errorPassword = true;
                        });
                      } else if (AppError.contains('email') ||
                          AppError.contains('Register an account')) {
                        setState(() {
                          errorEmail = true;
                        });
                      }
                    } else {
                      setState(() {
                        errorEmail = false;
                        errorPassword = false;
                        isSubmitting = true;
                      });
                      Toast.show("Login Successfull",
                          duration: 3,
                          gravity: Toast.bottom,
                          textStyle: const TextStyle(
                              fontSize: 14, color: Colors.white));
                      var token = res.body.split('api_token":"')[1];
                      var newToken = token.split('",')[0];
                      // Write value
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('token', newToken);
                      //
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return MainHome();
                      }));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                        color: setDefault == true
                            ? Colors.black
                            : AppColors.grey.withOpacity(.4),
                        borderRadius: BorderRadius.circular(200),
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
                              'Log in',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13),
                            ),
                    ),
                  ),
                ),

                //
                const SizedBox(
                  height: 12,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) {
                      return SignUp();
                    })));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColors.AppTheme,
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                            width: 1, color: AppColors.grey.withOpacity(.2))),
                    child: Center(
                      child: Text(
                        'Create account',
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
      ),
    );
  }
}
