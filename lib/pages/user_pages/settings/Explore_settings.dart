import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExploreSettingsPage extends StatefulWidget {
  ExploreSettingsPage({Key? key}) : super(key: key);

  @override
  State<ExploreSettingsPage> createState() => _ExploreSettingsPageState();
}

class _ExploreSettingsPageState extends State<ExploreSettingsPage> {
  bool checked = true;
  bool checked2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Explore Settings",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              ListTile(
                minVerticalPadding: 0,
                title: const Text(
                  "Location",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                subtitle: const Text("Show content in my location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                    "When this is on, you'll see what happening around you right now",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    )),
              ),
            ],
          ),
          Column(
            children: [
              ListTile(
                minVerticalPadding: 0,
                title: const Text(
                  "Location",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                subtitle: const Text("Show content in my location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    )),
                trailing: Checkbox(
                    value: checked2,
                    onChanged: (value) {
                      setState(() {
                        this.checked2 = value!;
                      });
                    }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                    "When this is on, you'll see what happening around you right now",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
