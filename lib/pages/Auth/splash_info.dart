import 'package:amerixapp/pages/Auth/log_in.dart';
import 'package:amerixapp/pages/Auth/sign_up.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/amerix_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/apple_btn.dart';
import '../../widgets/google_btn.dart';
import '../../widgets/rich_text_terms.dart';

class SplashInfoWidget extends StatelessWidget {
  const SplashInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: Column(
            children: [
              const AmerixIcon(),
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: 'hut',
                child: Image.asset(
                  'assets/Amerix-App-Icon-White.png',
                  height: 155,
                  width: 155,
                ),
              ),
              const GoogleBtn(
                title: 'Sign up with Google',
              ),
              const SizedBox(
                height: 10,
              ),
              const AppleBtn(
                title: 'Sign up with Apple',
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
                height: 20,
              ),
              //
              GestureDetector(
                onTap: () async {
                  Get.to(() => SignUp(), transition: Transition.cupertino);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                          width: 1, color: AppColors.grey.withOpacity(.2))),
                  child: Center(
                    child: Text(
                      'Sign up with email',
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              //
              const RichTextWidgetTerms(
                  label: 'By signing up, you agree to our ',
                  span: 'Terms of service',
                  span2: 'Privacy Policy.',
                  label2: ' and acknowledge that you have read our '),

              const SizedBox(
                height: 50,
              ),

              Text(
                'Already have an account?',
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(() => const LogInScreen(),
                      transition: Transition.cupertino);
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
                      'Sign in',
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
        ));
  }
}
