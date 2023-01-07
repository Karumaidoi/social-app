import 'package:amerixapp/pages/Main_Home/post_screen.dart';
import 'package:amerixapp/pages/user_pages/post/Comment_page.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as Tago;

class PostWidget extends StatelessWidget {
  final String name;
  final int totalReplies;
  final int totalZooms;
  final int totalLikes;
  final String username;
  final String time;
  final String tag;
  final String title;
  final String num;
  final bool isVideo;
  final String userImage;
  final String contentImage;
  const PostWidget(
      {Key? key,
      required this.name,
      required this.username,
      required this.time,
      required this.tag,
      required this.title,
      required this.num,
      required this.isVideo,
      required this.totalReplies,
      required this.totalZooms,
      required this.totalLikes,
      required this.userImage,
      required this.contentImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    showOverlay(
      BuildContext context,
      String image,
    ) async {
      OverlayState? overlayState = Overlay.of(context);
      OverlayEntry? overlayEntry;
      overlayEntry = OverlayEntry(
        builder: (context) => GestureDetector(
          child: Material(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 18),
                    child: Row(children: [
                      IconButton(
                          onPressed: () {
                            overlayEntry!.remove();
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: AppColors.white,
                          )),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Feather.download,
                            color: AppColors.white,
                          )),
                    ]),
                  ),
                  const Spacer(),
                  Center(
                    child: Image(image: AssetImage(image)),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      overlayState!.insert(overlayEntry);
    }

    return InkWell(
      onTap: () {
        Get.to(
            PostDScreen(
              name: name,
              username: username,
              time: time.toString(),
              tag: tag,
              num: num,
              title: title,
              userImage: 'http://159.89.16.24/$userImage',
            ),
            transition: Transition.cupertino);
      },
      child: Column(
        children: [
          ListTile(
            dense: true,
            // ignore: prefer_const_constructors
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            leading: CircleAvatar(
              backgroundImage: NetworkImage('http://159.89.16.24/$userImage'),
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
                  '@$username',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  time,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            subtitle: Text(
              tag,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: AppColors.AppTheme),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  // ignore: unrelated_type_equality_checks
                  isVideo == true
                      ? GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage(contentImage),
                                      fit: BoxFit.cover),
                                  color: AppColors.grey.withOpacity(.2),
                                ),
                              ),
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.grey.withOpacity(.4),
                                ),
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    radius: 20,
                                    child: Center(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.play_arrow))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            showOverlay(context, "assets/prof$num.jpg");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(contentImage),
                                  fit: BoxFit.cover),
                              color: AppColors.grey.withOpacity(.2),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
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
                                totalReplies.toString(),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: buildListTweet(context),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.loop_rounded,
                                  size: 19,
                                  color: AppColors.black.withOpacity(.7)),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                totalZooms.toString(),
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
                                size: 19,
                                color: AppColors.black.withOpacity(.7)),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              totalLikes.toString(),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
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
                    height: 8,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Divider(
                  thickness: 1,
                  color: AppColors.grey.withOpacity(.2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
            height: 5,
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
