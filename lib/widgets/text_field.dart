import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String content;
  final bool show;
  final bool suffixIcon;
  const TextFieldWidget({Key? key, required this.content, required this.show, required this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: AppColors.grey.withOpacity(.2))),
      child: Center(
        child: TextFormField(
          obscureText: show,
          style: TextStyle(fontSize: 13),
          decoration: InputDecoration(
              suffixIcon:
                  show == true ? Icon(Icons.remove_red_eye_outlined) : null,
              hintStyle: const TextStyle(fontSize: 13),
              hintText: content,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
