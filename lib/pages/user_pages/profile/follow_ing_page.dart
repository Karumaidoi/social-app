import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/user_follower.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text(""),
            shape: Border(
                bottom: BorderSide(
                    width: 1, color: AppColors.grey.withOpacity(.2))),
            bottom: TabBar(
                isScrollable: true,
                physics: const BouncingScrollPhysics(),
                labelColor: AppColors.AppTheme,
                unselectedLabelColor: AppColors.black,
                labelStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Turing"),
                tabs: <Widget>[
                  const Tab(
                    text: 'Followers',
                  ),
                  Tab(
                    child: Row(mainAxisSize: MainAxisSize.min, children: const [
                      Text(
                        "Following",
                        style: TextStyle(fontSize: 12),
                      ),
                    ]),
                  ),
                ]),
          ),

          //
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(children: const [
                FollowUser(
                    username: "Nyamiaka Lenson",
                    usertag: '@justadreamer',
                    about: 'Why we sleep', id: 2, token: '',),
                FollowUser(
                    username: "Alex Maina",
                    usertag: '@amerixdev',
                    about: 'Talk more about health', id: 2, token: '',),
              ]),
            ),
            SingleChildScrollView(
              child: Column(children: const [
                FollowingUser(
                    username: "Bruice Angel",
                    usertag: '@jangel',
                    about: 'African Angel'),
              ]),
            )
          ])),
    );
  }
}
