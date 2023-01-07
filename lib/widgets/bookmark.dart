import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/post_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookmarkPost extends StatelessWidget {
  const BookmarkPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: const Text(
            "Masculinity",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: buildList(context),
                        );
                      });
                },
                icon: const Icon(Icons.more_vert))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              BuildBookmark(
                name: 'Nelson Mandela',
                username: '@cardano',
                num: '2',
                tag: 'King of the JUNGLE',
                time: '',
              ),
              BuildBookmark(
                name: 'Lenny Amos',
                username: '@lenny',
                num: '3',
                tag: 'Night Firepower',
                time: '',
              ),
            ],
          ),
        ));
  }

  //
  buildList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.folder_open_rounded),
            title: const Text("Edit Folder",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(CupertinoIcons.trash),
            title: const Text("Delete Folder",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          const Divider(),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 13, color: AppColors.black),
                )),
          )
        ],
      ),
    );
  }
}

class BuildBookmark extends StatelessWidget {
  final String name;
  final String username;
  final String tag;
  final String time;
  final String num;
  const BuildBookmark(
      {Key? key,
      required this.name,
      required this.username,
      required this.tag,
      required this.time,
      required this.num})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/prof$num.jpg'),
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
              Text(
                username,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                width: 6,
              ),
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
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: AppColors.black),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: AppColors.grey.withOpacity(.4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                    AssetImage('assets/prof$num.jpg'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    name.split(" ")[0],
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    username,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    time,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                              "As long as you need money, a part of your soul is always for sale",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const PostActionsWidget(length: 0.85),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
