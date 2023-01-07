import 'package:amerixapp/pages/user_pages/store/set_up_success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/button.dart';

class VerifyStorePage extends StatelessWidget {
  const VerifyStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: AppColors.AppTheme,
            child: Center(
              child: Icon(
                CupertinoIcons.checkmark_seal,
                size: 30,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Verify your Store",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 8),
                const Text(
                  "In order to verify your store, you need to upload the business documents.  Kindly upload the following:",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(200)),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "Business Email",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(200)),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "Tax Pin",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          const Text(
            "Upload in PDF format",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        child: ButtonWidget(
            info: "Upload Documents",
            onClick: () {
              Get.to(() => const SetUpSuccess(),
                  transition: Transition.cupertino);
            }),
      ),
    );
  }
}
