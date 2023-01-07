import 'package:amerixapp/utils/app_colors.dart';
import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../widgets/post.dart';
import '../user_pages/post/Comment_page.dart';
import '../user_pages/post/new_post.dart';
import '../user_pages/store/create_store.dart';

class SafariPage extends StatefulWidget {
  const SafariPage({Key? key}) : super(key: key);

  @override
  State<SafariPage> createState() => _SafariPageState();
}

class _SafariPageState extends State<SafariPage> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.account_circle_outlined)),
          shape: Border(
              bottom:
                  BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
          title: const Text(
            'Safari',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Feather.settings,
                  size: 22,
                )),
          ],
          bottom: TabBar(
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              labelColor: AppColors.AppTheme,
              unselectedLabelColor: AppColors.black,
              labelStyle: const TextStyle(
                  fontFamily: "Turing",
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              tabs: const <Widget>[
                Tab(
                  text: 'All',
                ),
                Tab(text: 'Podcast'),
                Tab(text: 'Blog'),
                Tab(text: 'Video'),
              ]),
        ),
        body: TabBarView(children: <Widget>[
          SingleChildScrollView(
              child: Column(
            children: const [
              CustomBlog(
                  name: "Nelly Mandela",
                  username: '',
                  tag: "@cardano",
                  time: "16hr",
                  num: "2"),
              PodcastWodget(),
              PostWidget(
                  name: 'Nelly Mandela',
                  tag: '#africa',
                  time: '16hr',
                  title: 'King of JUNGLE',
                  username: '@cardano',
                  num: '3',
                  isVideo: true,
                  totalLikes: 0,
                  totalReplies: 0,
                  totalZooms: 0,
                  contentImage: '',
                  userImage: ''),
              CustomBlog(
                  name: "Alnold Nesni",
                  username: '',
                  tag: "@alnold",
                  time: "23hr",
                  num: "3"),
            ],
          )),
          SingleChildScrollView(
              child: Column(children: const [
            PodcastWodget(),
            PodcastWodget(),
          ])),
          SingleChildScrollView(
              child: Column(
            children: const [
              CustomBlog(
                  name: "Alnold Nesni",
                  username: '',
                  tag: "@alnold",
                  time: "23hr",
                  num: "3"),
            ],
          )),
          SingleChildScrollView(
            child: Column(children: const [
              PostWidget(
                  name: 'Nelly Mandela',
                  tag: '#africa',
                  time: '16hr',
                  title: 'King of JUNGLE',
                  username: '@cardano',
                  num: '3',
                  isVideo: true,
                  totalLikes: 0,
                  totalReplies: 0,
                  totalZooms: 0,
                  contentImage: '',
                  userImage: ''),
            ]),
          ),
        ]),
        //
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: AppColors.AppTheme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200)),
                largeSizeConstraints:
                    const BoxConstraints.tightFor(width: 100, height: 100)),
          ),
          child: SpeedDial(
            overlayColor: AppColors.black,
            overlayOpacity: 0.95,
            spaceBetweenChildren: 20,
            onOpen: () {
              setState(() {
                isOpen = true;
              });
            },
            onClose: () {
              setState(() {
                isOpen = false;
              });
            },
            // animatedIcon: AnimatedIcons.close_menu,
            icon: isOpen == false ? Icons.add : Icons.close,
            children: [
              SpeedDialChild(
                label: "Studio",
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200)),
                child: Icon(Icons.rocket_launch_outlined,
                    color: AppColors.AppTheme),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBlog extends StatelessWidget {
  final String name;
  final String username;
  final String tag;
  final String time;
  final String num;
  const CustomBlog(
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
        ListTileWidget(
            num: num, name: name, username: username, time: time, tag: tag),
        Row(
          children: [
            const Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: const BlogWidget()),
          ],
        )
      ],
    );
  }
}

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Chip(
                  backgroundColor: AppColors.AppTheme.withOpacity(.1),
                  label: Text(
                    "Men\'s Health",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  )),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "DEADLY DOUGH: 5 reasons why you should stop eating wheat",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "if you want all pins to be the same don't pass other theme parameters, If not, create focusedPinTheme.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Show more",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppColors.AppTheme),
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const CommentPage(),
                        transition: Transition.cupertino);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/Reply Icon 20 x 20.svg",
                        height: 25,
                        width: 25,
                      ),
                      Text(
                        '10.3k',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
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
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: buildListTweet(context),
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.loop_rounded,
                          size: 19, color: AppColors.black.withOpacity(.7)),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_outline_rounded,
                        size: 19, color: AppColors.black.withOpacity(.7)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(.5)),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
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
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: buildList(context),
                          );
                        });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/Forward Icon 2 20 x 20.svg",
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
        ],
      ),
    );
  }

  //
  buildListTweet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.loop),
              title: const Text("Retweet",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.edit_outlined),
              title: const Text("Quote Tweet",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  //
  buildList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const Text("Share Post",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.bookmark_border_rounded),
            title: const Text("Bookmark",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.link),
            title: const Text("Copy Link",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.share_outlined),
            title: const Text("Share to other apps",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
              // height: 5,
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

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.num,
    required this.name,
    required this.username,
    required this.time,
    required this.tag,
  }) : super(key: key);

  final String num;
  final String name;
  final String username;
  final String time;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/prof$num.jpg'),
      ),
      trailing: GestureDetector(
        onTap: () {
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
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: buildListMore(context),
                );
              });
        },
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
            width: 4,
          ),
          Text(
            tag,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          ),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }

  buildListMore(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Feather.user_plus),
            title: const Text("Subscribe to this account",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.volume_mute),
            title: const Text("Mute @Lenson",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.block),
            title: const Text("Block @Lenson",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.flag_outlined),
            title: const Text("Repost Post",
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

class PodcastWodget extends StatelessWidget {
  const PodcastWodget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ListTileWidget(
          num: '2',
          name: "Nelly Mandela",
          username: "",
          time: "16hr",
          tag: '@mandela'),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                children: [
                  Row(
                    children: [
                      Chip(
                        backgroundColor: AppColors.AppTheme.withOpacity(.1),
                        label: Text(
                          "Chini ya maji media",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Founder Serie: Mark Mwangi, CO-Founder & CEO @ Amitruck",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Leveraging Tech in the African Logistics Landscape...",
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.play_circle_outline_rounded,
                                size: 19, color: AppColors.AppTheme),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '1 hr 0 min',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black.withOpacity(.5)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite_outline_rounded,
                                size: 19,
                                color: AppColors.black.withOpacity(.7)),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black.withOpacity(.5)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/Forward Icon 2 20 x 20.svg",
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider()
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
