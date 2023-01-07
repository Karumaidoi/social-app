import 'package:amerixapp/pages/splash_screen.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Account Information",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Tile(
            info: 'justadreamer',
            title: 'Username',
            onClick: () {},
          ),
          Tile(
            info: 'mainahmwangi12@gmail.com',
            title: 'Email',
            onClick: () {},
          ),
          Tile(
            info: 'Add a phone number',
            title: 'Phone Number',
            onClick: () {},
          ),
          Tile(
            info: 'Change password',
            title: 'Password',
            onClick: () {},
          ),
          Tile(
            info: 'Apply for verification',
            title: 'Verification',
            onClick: () {},
          ),
          const Divider(),
          ListTile(
            onTap: () async {
              _showMyDialog(context);
            },
            leading: Icon(
              Feather.log_out,
              color: AppColors.red,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.red,
              ),
            ),
          )
        ],
      ),
    );
  }

  //
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Log out',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text(
                  'Your account will be temporally disabled.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.AppTheme,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ok',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.AppTheme,
                  )),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();

                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return SplashScreen();
                }));
              },
            ),
          ],
        );
      },
    );
  }
}

class Tile extends StatelessWidget {
  final String title;
  final String info;
  final VoidCallback onClick;
  const Tile({
    Key? key,
    required this.title,
    required this.info,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      title: Text(
        title,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        info,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w100),
      ),
    );
  }
}
