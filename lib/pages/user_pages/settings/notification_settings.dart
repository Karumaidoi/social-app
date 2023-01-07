import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotifSettingsPage extends StatefulWidget {
  NotifSettingsPage({Key? key}) : super(key: key);

  @override
  State<NotifSettingsPage> createState() => _NotifSettingsPageState();
}

class _NotifSettingsPageState extends State<NotifSettingsPage> {
  bool checked = true;
  bool checked2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Notification Settings",
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
              "Select the kind of notifications ypu want to receive",
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
            children: const [
              ListTile(
                minVerticalPadding: 0,
                title: Text(
                  "Filters",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                subtitle: Text(
                    "Choose the kind of notifications you'd like to you and those you don't",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                    )),
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14),
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
                  "Allow push notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
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
