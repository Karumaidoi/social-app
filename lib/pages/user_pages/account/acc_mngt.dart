import 'package:amerixapp/pages/user_pages/account/account_info.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AccountMng extends StatelessWidget {
  const AccountMng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Account Management",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
         
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Tile(
                title: "Deactivate Account",
                info: "Find out how to deactivate your account",
                onClick: () {}),
          ),
          
        ],
      ),
    );
  }
}
