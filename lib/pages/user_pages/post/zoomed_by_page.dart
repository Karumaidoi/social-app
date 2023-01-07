import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/user_follower.dart';

class ZoomedPage extends StatelessWidget {
  const ZoomedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Zoomed by",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      //
      body: SingleChildScrollView(
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
    );
  }
}
