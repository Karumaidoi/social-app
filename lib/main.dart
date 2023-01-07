import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      key: const ValueKey("main widget"),
      title: 'Amerix',
      theme: ThemeData(
        inputDecorationTheme:
            InputDecorationTheme(suffixIconColor: AppColors.AppTheme),
        //Makes use of the new Google **MATERIAL YOU**
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData( 
          cursorColor: AppColors.AppTheme,
          selectionColor: AppColors.AppTheme,
          selectionHandleColor: AppColors.AppTheme,
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: AppColors.AppTheme,
        ),
        fontFamily: 'Turing',
        colorScheme: const ColorScheme.light(),
        primaryColor: AppColors.AppTheme,
      ),
      home: const SplashScreen(),
    );
  }
}
