import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RichTextWidgetTerms extends StatelessWidget {
  final String label;
  final String span;
  final String span2;
  final String label2;
  const RichTextWidgetTerms(
      {Key? key,
      required this.label,
      required this.span,
      required this.span2,
      required this.label2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.black,
          fontFamily: 'Turing',
        ),
        children: <TextSpan>[
          TextSpan(
              text: span,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                fontFamily: 'Turing',
                color: AppColors.AppTheme,
              )),
          TextSpan(
            text: label2,
            style: const TextStyle(
              fontSize: 10,
              fontFamily: 'Turing',
            ),
          ),
          TextSpan(
              text: span2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                fontFamily: 'Turing',
                color: AppColors.AppTheme,
              )),
        ],
      ),
    );
  }
}
