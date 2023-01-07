import 'package:amerixapp/pages/user_pages/account/acc_mngt.dart';
import 'package:amerixapp/pages/user_pages/account/account_info.dart';
import 'package:amerixapp/pages/user_pages/account/privacy_page.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AccountInfo();
                }));
              },
              leading: const Icon(Feather.user),
              title: const Text(
                "Account Information",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                "See information about your acccount. Edit your data in a secure way",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PrivacyPage();
                }));
              },
              leading: const Icon(Icons.verified_user_outlined),
              title: const Text(
                "Privacy and Safety",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                "Control how other users can access you and your information",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AccountMng();
                }));
              },
              leading: const Icon(Feather.settings),
              title: const Text(
                "Account Management",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                "Control your Amerix account. Learn about your account deactivation options.",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w100),
              ),
            ),
          )
        ],
      ),
    );
  }
}
