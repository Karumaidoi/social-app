import 'dart:convert';

import 'package:amerixapp/pages/Auth/create_password.dart';
import 'package:amerixapp/pages/Auth/create_username.dart';
import 'package:amerixapp/pages/Auth/set_password.dart';
import 'package:amerixapp/pages/Auth/success_reset.dart';
import 'package:amerixapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import '../../../model/userService.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/amerix_icon.dart';

class VerifyResetPassword extends StatefulWidget {
  final String emailSent;
  VerifyResetPassword({Key? key, required this.emailSent}) : super(key: key);

  @override
  State<VerifyResetPassword> createState() => _VerifyResetPasswordState();
}

class _VerifyResetPasswordState extends State<VerifyResetPassword> {
  bool showOTPError = false;
  bool showNext = false;
  String? token;
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
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                    "Enter Verification code",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'code sent to ',
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Turing',
                          fontWeight: FontWeight.w200,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.emailSent.toLowerCase(),
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
                  onCompleted: (pin) => {verifyToken(pin)},
                ),
                const SizedBox(
                  height: 15,
                ),
                //
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
                          UserServive.resendOTP(widget.emailSent);
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
                  height: 65,
                ),

                //
                showNext == true
                    ? ButtonWidget(
                        info: "Continue",
                        onClick: () {
                          Get.to(
                              () => SetPassword(
                                    token: token!,
                                  ),
                              transition: Transition.cupertino);
                        })
                    : GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 45,
                          decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(.4),
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
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  verifyToken(String pin) async {
    var res = await UserServive.verifyOTP(pin);

    var token = res.body.split('api_token":"')[1];
    var newToken = token.split('",')[0];

    //Set the state
    setState(() {
      this.token = newToken;
    });

    if (res.statusCode != 201) {
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
  }
}
