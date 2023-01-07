// ignore_for_file: non_constant_identifier_names

import 'package:amerixapp/pages/user_pages/messages/chat_page.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/post_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../widgets/likes_page.dart';
import '../../widgets/zoom_quote.dart';
import '../user_pages/post/zoomed_by_page.dart';

class PostDScreen extends StatelessWidget {
  final String name;
  final String username;
  final String time;
  final String tag;
  final String num;
  final String title;
  final String userImage;
  const PostDScreen(
      {Key? key,
      required this.name,
      required this.username,
      required this.time,
      required this.tag,
      required this.num,
      required this.title,
      required this.userImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'Post',
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
                  backgroundImage: NetworkImage(userImage),
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
              ImageWidget(
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

  buildListMore(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Feather.user_plus),
            title: const Text("Follow @Lenson",
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

//
class ImageWidgetMarket extends StatelessWidget {
  final String title;
  final String num;
  final String username;
  final String name;
  final String tag;
  final String time;
  const ImageWidgetMarket(
      {Key? key,
      required this.title,
      required this.num,
      required this.username,
      required this.name,
      required this.tag,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
                image: AssetImage('assets/shoes.jpg'), fit: BoxFit.cover),
            color: AppColors.grey.withOpacity(.2),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        // Post Details//
        PostDetails(context),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Matte Black, Limited edition",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "KES 6,500",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.AppTheme),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Kiambu, Nairobi",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                )
              ],
            ),
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.AppTheme)),
              onPressed: () {
                Get.to(
                    () => ChatPage(
                        image: 'assets/prof$num.jpg',
                        name: name,
                        username: username,
                        chatStarted: false),
                    transition: Transition.native);
              },
              child: Text(
                "Buy Now",
                style: TextStyle(fontSize: 12, color: AppColors.white),
              ),
            )
          ]),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Divider(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Description",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "We would like your help developing this experience! You can be a part of the process by joining the waiting list where, in due course",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(children: [
            Icon(
              Icons.star,
              color: AppColors.AppTheme,
              size: 13,
            ),
            Text(
              "4.7",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.AppTheme),
            ),
            Text(
              "(200 Ratings)",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black),
            ),
          ]),
        ),
        CommentsDetailsMarket(
          context,
          name,
          username,
          tag,
          time,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Divider()),
        SizedBox(
          height: 230,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(children: [
            Row(children: [
              Text(
                "More from this shop",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text("See All",
                      style:
                          TextStyle(fontSize: 12, color: AppColors.AppTheme))),
            ]),
            SizedBox(
              height: 195,
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 195,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 25),
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 105,
                            width: 450,
                            decoration: BoxDecoration(
                                color: AppColors.grey.withOpacity(.4),
                                image: const DecorationImage(
                                    image: AssetImage("assets/shoes3.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Matte Black, Limited edition",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "KES 6,500",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.AppTheme),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 105,
                            width: 450,
                            decoration: BoxDecoration(
                                color: AppColors.grey.withOpacity(.4),
                                image: const DecorationImage(
                                    image: AssetImage("assets/shoes.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Matte Black, Limited edition",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "KES 6,500",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.AppTheme),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
            )
          ]),
        )
      ],
    );
  }

  Widget PostDetails(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 40,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    '23:33',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black.withOpacity(.5)),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: AppColors.AppTheme),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '24 june 2022',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black.withOpacity(.5)),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: AppColors.AppTheme),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Amerix for Android',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.AppTheme.withOpacity(1)),
                  )
                ],
              ),
            ],
          ),
          const Divider(
            height: 23,
          ),
        ],
      ),
    );
  }

  WriteComent(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.6,
            child: const TextField(
              maxLines: 2,
              // maxLength: 99,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a comment',
                  hintStyle: TextStyle(fontSize: 13)),
            )),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.AppTheme)),
          child: Text(
            'Comment',
            style: TextStyle(fontSize: 13, color: AppColors.white),
          ),
        )
      ],
    );
  }

  CommentsDetails(BuildContext context, String name, String username,
      String tag, String time) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
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
              "Replying to $username",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                  color: AppColors.grey.withOpacity(.5)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Text(
                "It is the second largest big cat after the tiger",
                style: TextStyle(fontSize: 12)),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Spacer(),
                PostActions(
                  length: 0.5,
                ),
                Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }

  //
  CommentsDetailsMarket(BuildContext context, String name, String username,
      String tag, String time) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          ListTile(
            isThreeLine: true,
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
              "You will recieve updates on the project and assist during testing phases.",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                  color: AppColors.grey),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text("See more",
                          style: TextStyle(
                              fontSize: 12, color: AppColors.AppTheme))),
                  const Spacer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Image Widget//
class ImageWidget extends StatelessWidget {
  final String title;
  final String num;
  final String username;
  final String name;
  final String tag;
  final String time;
  const ImageWidget(
      {Key? key,
      required this.title,
      required this.num,
      required this.username,
      required this.name,
      required this.tag,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage('assets/prof$num.jpg'),
                      fit: BoxFit.cover),
                  color: AppColors.grey.withOpacity(.2),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Post Details//
              PostDetails(context),
              //
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Divider(
                    height: 3,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ZoomedPage(),
                            transition: Transition.cupertino);
                      },
                      child: Row(
                        children: [
                          Text(
                            '420',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black.withOpacity(.9)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Zooms',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black.withOpacity(.5)),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ZoomQuotes(),
                            transition: Transition.cupertino);
                      },
                      child: Row(
                        children: [
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black.withOpacity(.9)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Quotes',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black.withOpacity(.5)),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LikedPage(),
                            transition: Transition.cupertino);
                      },
                      child: Row(
                        children: [
                          Text(
                            '1.2K',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black.withOpacity(.9)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Likes',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black.withOpacity(.5)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 20,
                child: const Divider(),
              ),
              //
              const PostActions(
                length: 0.9,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 20,
                child: const Divider(),
              ),
              CommentsDetails(
                context,
                name,
                username,
                tag,
                time,
              ),
              CommentsDetails(
                context,
                name,
                username,
                tag,
                time,
              ),
            ],
          ),
        ),
      ],
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
            title: const Text("Follow @Lenson",
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

  Widget PostDetails(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 40,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    '23:33',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black.withOpacity(.5)),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: AppColors.AppTheme),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '24 june 2022',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black.withOpacity(.5)),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: AppColors.AppTheme),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Amerix for Android',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.AppTheme.withOpacity(1)),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  WriteComent(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.6,
            child: const TextField(
              maxLines: 2,
              // maxLength: 99,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a comment',
                  hintStyle: TextStyle(fontSize: 13)),
            )),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.AppTheme)),
          child: Text(
            'Comment',
            style: TextStyle(fontSize: 13, color: AppColors.white),
          ),
        )
      ],
    );
  }

  CommentsDetails(BuildContext context, String name, String username,
      String tag, String time) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
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
              "Replying to $username",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                  color: AppColors.grey.withOpacity(.5)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Text(
                "It is the second largest big cat after the tiger",
                style: TextStyle(fontSize: 12)),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Spacer(),
                PostActions(
                  length: 0.5,
                ),
                Spacer()
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
