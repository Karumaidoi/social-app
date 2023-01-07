import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GoogleBtn extends StatelessWidget {
  final String title;
  const GoogleBtn({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            border:
                Border.all(width: 1, color: AppColors.grey.withOpacity(.2))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Google.png', height: 18, width: 18),
              const SizedBox(
                width: 16,
              ),
               Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ));
  }
}
