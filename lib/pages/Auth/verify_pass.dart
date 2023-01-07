import 'dart:convert';

import 'package:amerixapp/model/userService.dart';
import 'package:amerixapp/pages/Auth/create_password.dart';
import 'package:amerixapp/pages/Auth/create_username.dart';
import 'package:amerixapp/widgets/amerix_icon.dart';
import 'package:amerixapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import '../../utils/app_colors.dart';

class VerifyPassword extends StatefulWidget {
  final String email;
  VerifyPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  bool showNext = false;
  bool showOTPError = false;
  String? BearerToken;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
                  height: 62,
                ),
                const Center(
                  child: Text(
                    "Enter OTP code",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'OTP code sent to ',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Turing',
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.email,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: 'Turing',
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 45,
                ),
                //

                Pinput(
                  length: 6,
                  errorTextStyle: TextStyle(fontSize: 12, color: AppColors.red),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onChanged: (pin) {
                    setState(() {
                      showOTPError = false;
                    });
                  },
                  onCompleted: (pin) => {verifyTokoken(pin)},
                ),
                const SizedBox(
                  height: 15,
                ),

                showOTPError == true
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Wrong OTP code',
                            style: TextStyle(
                                fontSize: 9,
                                color: AppColors.red,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : const SizedBox(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Toast.show("Verification code sent",
                              duration: 3,
                              gravity: Toast.bottom,
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Colors.white));
                          UserServive.resendOTP(widget.email);
                        },
                        child: const Text("Resend",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ))),
                  ],
                ),

                const SizedBox(
                  height: 95,
                ),

                //
                showNext == true
                    ? ButtonWidget(
                        info: "Continue",
                        onClick: () {
                          Get.to(
                              () => CreateUsername(
                                    token: BearerToken!,
                                  ),
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

  //SENDING TOKEN
  verifyTokoken(String otpCode) async {
    var info = await UserServive.verifyOTPSignUp(otpCode);
    if (info.statusCode != 201) {
      setState(() {
        showNext = false;
        showOTPError = true;
      });
    } else {
      setState(() {
        showNext = true;
        showOTPError = false;
      });
    }
    var token = info.body.split('api_token":"')[1];
    var newToken = token.split('",')[0];
    setState(() {
      BearerToken = newToken;
    });
  }
}
