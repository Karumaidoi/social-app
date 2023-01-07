import 'package:amerixapp/pages/Auth/set_profile.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/amerix_icon.dart';
import '../../widgets/button.dart';

class SignUpScreenSucess extends StatefulWidget {
  final String BearerToken;
  const SignUpScreenSucess({Key? key, required this.BearerToken})
      : super(key: key);

  @override
  State<SignUpScreenSucess> createState() => _SignUpScreenSucessState();
}

class _SignUpScreenSucessState extends State<SignUpScreenSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                AmerixIcon(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'You have successfully created an account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/SignUp Celebration Blue 55 x 55.svg',
              height: 125,
            ),
            ButtonWidget(
                info: "Next",
                onClick: () {
                  print(widget.BearerToken);
                  Get.to(
                      () => Setprofile(
                            bearerToken: widget.BearerToken,
                          ),
                      transition: Transition.cupertino);
                }),
          ],
        ),
      ),
    );
  }
}
