import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../pages/user_pages/post/Comment_page.dart';
import '../utils/app_colors.dart';

class PostActions extends StatelessWidget {
  final double length;
  const PostActions({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = length;
    return SizedBox(
      width: MediaQuery.of(context).size.width * value,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const CommentPage(),
                  transition: Transition.cupertino);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/Reply Icon 20 x 20.svg",
                  height: 25,
                  width: 25,
                ),
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
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.favorite_outline_rounded,
                  size: 19, color: AppColors.black.withOpacity(.7)),
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
}

//
class PostActionsWidget extends StatelessWidget {
  final double length;
  const PostActionsWidget({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = length;
    return SizedBox(
      width: MediaQuery.of(context).size.width * value,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CommentPage();
              }));
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/Reply Icon 20 x 20.svg",
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '10.3k',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(.5)),
                )
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.loop_rounded,
                  size: 19, color: AppColors.black.withOpacity(.7)),
              const SizedBox(
                width: 8,
              ),
              Text(
                '3',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black.withOpacity(.5)),
              )
            ],
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
                    fontSize: 13,
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
                Icon(Ionicons.md_share_social,
                    size: 19, color: AppColors.black.withOpacity(.7)),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          )
        ],
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
