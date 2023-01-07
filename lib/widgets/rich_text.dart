import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String label;
  const RichTextWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
            fontFamily: 'Turing',
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black),
        children: <TextSpan>[
          TextSpan(
              text: '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: 'Turing',
                color: AppColors.red,
              )),
        ],
      ),
    );
  }
}
