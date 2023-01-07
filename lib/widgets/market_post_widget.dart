import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/Main_Home/post_screen.dart';
import '../utils/app_colors.dart';

class MarketDetails extends StatelessWidget {
  final String name;
  final String username;
  final String time;
  final String tag;
  final String title;
  final String num;
  const MarketDetails({Key? key, required this.name, required this.username, required this.time, required this.tag, required this.title, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'Marketplace',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/prof$num.jpg'),
                ),
                trailing: GestureDetector(
                  child: const Icon(Icons.more_vert_rounded),
                ),
                title: Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(CupertinoIcons.checkmark_seal_fill,
                        size: 12, color: AppColors.AppTheme),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                subtitle: Text(
                  username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: AppColors.grey.withOpacity(.5)),
                ),
              ),
              //
              ImageWidgetMarket(
                title: title,
                num: num,
                name: name,
                username: username,
                tag: tag,
                time: time,
              )
            ],
          ),
        ),
      ),
    );
  }
}
