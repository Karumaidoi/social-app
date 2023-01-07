import 'package:amerixapp/utils/app_colors.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../settings/notification_settings.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
            backgroundColor: AppColors.white,
            title: const Text(
              "Notifications",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            bottom: TabBar(
                isScrollable: false,
                physics: const BouncingScrollPhysics(),
                labelColor: AppColors.AppTheme,
                unselectedLabelColor: AppColors.black,
                labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Turing",
                ),
                tabs: const <Widget>[
                  Tab(
                    text: 'All',
                  ),
                  Tab(text: 'Marketplace'),
                ]),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => NotifSettingsPage(),
                        transition: Transition.cupertino);
                  },
                  icon: const Icon(
                    Feather.settings,
                    size: 22,
                  )),
            ]),
        body: TabBarView(children: [
          SingleChildScrollView(
              child: Column(
            children: const [
              NotifTile(
                name: 'Eric Amerix',
                tag:
                    'Your business account has been verified. Go to Amerix Marketplace',
                time: '2h',
                username: '@amerix',
                isRead: false,
              ),
              NotifTile(
                name: 'Evans Antony',
                tag: 'Evan followed you.',
                time: '4h',
                username: '@evantony',
                isRead: true,
              ),
            ],
          )),
          Text("")
        ]),
      ),
    );
  }
}

class NotifTile extends StatelessWidget {
  final String name;
  final String username;
  final String tag;
  final String time;
  final bool isRead;
  const NotifTile(
      {Key? key,
      required this.name,
      required this.username,
      required this.tag,
      required this.time,
      required this.isRead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          isThreeLine: true,
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/prof2.jpg'),
          ),
          trailing: isRead ? Badge() : SizedBox(),
          title: Row(
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 1,
              ),
              Text(
                username,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Text(
                time,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
              ),
            ],
          ),
          subtitle: Text(
            tag,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11,
                color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
