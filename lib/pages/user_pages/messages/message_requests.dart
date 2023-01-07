import 'package:amerixapp/pages/Home/messages_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class MessageRequests extends StatelessWidget {
  const MessageRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: Border(
            bottom:
                BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
        title: const Text(
          'Message Requets',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          MessageTile(
              time: '20 Apr',
              tag: '@joseph',
              num: '2',
              username: 'machera',
              name: 'Joseph Machera',
              chatStart: true),
          MessageTile(
              time: '14 June',
              tag: '@pesh',
              num: '3',
              username: 'pesh',
              name: 'Peris Mwongela',
              chatStart: true),
        ],
      )),
    );
  }
}
