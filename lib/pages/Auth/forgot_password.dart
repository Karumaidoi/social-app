import 'package:amerixapp/widgets/rich_text.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import '../../model/userService.dart';
import '../../utils/app_colors.dart';
import '../../widgets/amerix_icon.dart';
import '../../widgets/rich_text_terms.dart';
import 'forgot password/verify_password_reset.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = '';
  bool errorEmail = false;
  bool isSubmitting = false;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AmerixIcon(),
              const SizedBox(
                height: 15,
              ),
              SvgPicture.asset(
                'assets/Smoke Outline.svg',
                height: 150,
                width: 150,
                color: AppColors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.AppTheme,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //
              const RichTextWidgetTerms(
                  label: 'By signing up, you agree to our ',
                  span: 'Terms of service',
                  span2: 'Privacy Policy.',
                  label2: ' and acknowledge that you have read our '),

              //
              const SizedBox(
                height: 20,
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
                                width: 1, color: AppColors.grey.withOpacity(.2))
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
                              'Please use the correct email',
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
                height: 20,
              ),

              email == ''
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(
                              width: 1, color: AppColors.grey.withOpacity(.2))),
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
                        setState(() {
                          isSubmitting = true;
                        });
                        var res = await UserServive.forgotPassword(email);

                        if (res.statusCode != 201) {
                          setState(() {
                            errorEmail = true;
                            isSubmitting = false;
                          });
                          return;
                        }

                        setState(() {
                          isSubmitting = false;
                        });

                        //
                        Toast.show("Verification code sent",
                            duration: 3,
                            gravity: Toast.bottom,
                            textStyle: const TextStyle(
                                fontSize: 14, color: Colors.white));

                        Get.to(
                            () => VerifyResetPassword(
                                  emailSent: email,
                                ),
                            transition: Transition.cupertino);
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
        ),
      ),
    );
  }

  //
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

}
