import 'package:amerixapp/pages/Auth/log_in.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/amerix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/button.dart';

class SuccessScreen extends StatelessWidget {
  final String token;
  const SuccessScreen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: const [
                AmerixIcon(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'You have successfully changed \n your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset(
                  'assets/SignUp Celebration Blue 55 x 55.svg',
                  height: 125),
            ),
            ButtonWidget(
                info: "Log in to Amerix",
                onClick: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const LogInScreen();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
