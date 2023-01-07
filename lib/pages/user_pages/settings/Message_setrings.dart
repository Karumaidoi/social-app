import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MessageSettingsPage extends StatefulWidget {
  MessageSettingsPage({Key? key}) : super(key: key);

  @override
  State<MessageSettingsPage> createState() => _MessageSettingsPageState();
}

class _MessageSettingsPageState extends State<MessageSettingsPage> {
  bool checked = true;
  bool checked2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Message Settings",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Manage who can message you directly",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              ListTile(
                minVerticalPadding: 0,
                title: const Text(
                  "Allow message requests from everyone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                subtitle: const Text(
                    "Let people who you dont't follow send you message requests. To reply to their messages, you need to accept their requests",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                    )),
                trailing: Checkbox(
                    value: checked,
                    onChanged: (value) {
                      setState(() {
                        this.checked = value!;
                      });
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              ListTile(
                minVerticalPadding: 0,
                title: const Text(
                  "Show read receipts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                subtitle: const Text(
                    "Let people you're messaging with, know when you've seen their messages",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                    )),
                trailing: Checkbox(
                    value: checked2,
                    onChanged: (value) {
                      setState(() {
                        this.checked = value!;
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
