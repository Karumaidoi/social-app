import 'package:amerixapp/model/userService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_colors.dart';

class InterestChips extends StatelessWidget {
  final String info1;
  const InterestChips({Key? key, required this.info1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        ChipWidget(
          info: info1,
          id: 12,
          token: '',
        )
      ],
    );
  }
}

class ChipWidget extends StatefulWidget {
  final String info;
  final int id;
  final String token;

  const ChipWidget({
    Key? key,
    required this.info,
    required this.id,
    required this.token,
  }) : super(key: key);

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool isSelected = false;
  String token = '';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          // isSelected = true;
          counter++;
          if (isSelected == false) {
            isSelected = true;
          } else {
            isSelected = true;
          }
        });

        await UserServive.ChooseInterests(widget.token, widget.id);
      },
      child: Chip(
        backgroundColor:
            isSelected == true ? AppColors.AppTheme : Colors.transparent,
        label: Text(
          widget.info,
          style: TextStyle(
            fontSize: 13,
            color: isSelected == true ? Colors.white : Colors.black,
          ),
        ),
        shape: RoundedRectangleBorder(
            side:
                BorderSide(width: 1, color: AppColors.AppTheme.withOpacity(.2)),
            borderRadius: BorderRadius.circular(200)),
      ),
    );
  }
}
