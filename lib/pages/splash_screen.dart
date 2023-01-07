// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:amerixapp/pages/Auth/splash_info.dart';
import 'package:amerixapp/pages/Main_Home/main_home.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = '';
  @override
  void initState() {
    token_read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      token != '0'
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => MainHome()))
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const SplashInfoWidget()));
    });
    return Scaffold(
      key: const ValueKey("Splash screen"),
      backgroundColor: AppColors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'hut',
                child: Image.asset(
                  'assets/Amerix-App-Icon-White.png',
                  height: 155,
                  width: 155,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  //
  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'token';
    var read_value = prefs.getString(key) ?? 0;
    setState(() {
      token = read_value.toString();
      print(token.runtimeType);
    });
    print('read: $token');
    return read_value;
  }
}
