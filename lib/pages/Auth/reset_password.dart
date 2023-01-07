import 'package:amerixapp/pages/Auth/success_reset.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Reset your password",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: const TextSpan(
                    text:
                        'Strong passwords must include numbers, letters, and special characters.',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                const TextFieldWidget(
                  content: "Enter your new password",
                  show: true,
                  suffixIcon: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextFieldWidget(
                  content: "Repeat new password",
                  show: true,
                  suffixIcon: false,
                ),
              ],
            ),
            ButtonWidget(
                info: "Reset Password",
                onClick: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SuccessScreen(token: '',);
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
