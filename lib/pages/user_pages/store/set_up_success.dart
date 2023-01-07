import 'package:amerixapp/pages/Auth/interests_page.dart';
import 'package:amerixapp/pages/Home/Home_screen.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/button.dart';

class SetUpSuccess extends StatelessWidget {
  const SetUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset('assets/Amx.svg', height: 15, width: 15),
            ),
            const Text(
              'Your document has been uploaded successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            ButtonWidget(
                info: "Bact To Home",
                onClick: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
