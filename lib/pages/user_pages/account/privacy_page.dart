import 'package:amerixapp/pages/user_pages/account/account_info.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Privacy and Safety",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Tile(
                title: "Muted Accounts",
                info: "Manage the accounts you have muted",
                onClick: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Tile(
                title: "Blocked Accounts",
                info: "Manage the accounts you have blocked",
                onClick: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Tile(
                title: "Messaging",
                info: "Manage who can message directly",
                onClick: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Tile(
                title: "Notofications",
                info: "Control the notifications you would like to receive",
                onClick: () {}),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Terms of Service",
                      style: TextStyle(
                        color: AppColors.AppTheme,
                        fontSize: 12,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: AppColors.AppTheme,
                        fontSize: 12,
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
