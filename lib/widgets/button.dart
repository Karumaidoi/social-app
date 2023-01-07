import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String info;
  final VoidCallback onClick;
  const ButtonWidget({Key? key, required this.info, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 45,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(200),
            border:
                Border.all(width: 1, color: AppColors.grey.withOpacity(.2))),
        child: Center(
          child: Text(
            info,
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}
