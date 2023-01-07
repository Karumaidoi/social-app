import 'package:amerixapp/pages/Main_Home/post_screen.dart';
import 'package:amerixapp/pages/user_pages/market/market_reviews.dart';
import 'package:amerixapp/pages/user_pages/messages/chat_page.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import 'market_post_widget.dart';

class MarketPostWidget extends StatelessWidget {
  final String name;
  final String username;
  final String time;
  final String tag;
  final String title;
  final String num;
  const MarketPostWidget(
      {Key? key,
      required this.name,
      required this.username,
      required this.time,
      required this.tag,
      required this.title,
      required this.num})
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
          onTap: () {
            overlayEntry!.remove();
          },
          child: Material(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 0, 0, 0),
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
            () => MarketDetails(
                name: name,
                username: username,
                time: time,
                tag: tag,
                title: title,
                num: num),
            transition: Transition.cupertino);
      },
      child: Column(
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
                const SizedBox(
                  width: 4,
                ),
                Text(
                  username,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w200),
                ),
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
              title,
              style: const TextStyle(fontSize: 12),
            ),
            trailing: InkWell(
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
                child: const Icon(Feather.more_vertical)),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tag,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: AppColors.AppTheme),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      showOverlay(context, 'assets/shoes.jpg');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage('assets/shoes.jpg'),
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
                      children: [
                        Text(
                          'KES 6,500',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: AppColors.AppTheme),
                        ),
                        const Spacer(),
                        const Text(
                          "Kiambu, Nairobi",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const MarketReviews(),
                                transition: Transition.cupertino);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                  Text(
                                    "4.7",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Text(
                                "(200)",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.AppTheme,
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => ChatPage(
                                      image: '2',
                                      name: name,
                                      username: username,
                                      chatStarted: true,
                                    ),
                                transition: Transition.cupertino);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(200),
                                border: Border.all(
                                    width: 1,
                                    color: AppColors.grey.withOpacity(.2))),
                            child: Center(
                              child: Text(
                                'Buy now',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
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
          Divider(
            thickness: 1,
            color: AppColors.grey.withOpacity(.2),
          ),
        ],
      ),
    );
  }

  //
  buildListMore(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Ionicons.volume_mute),
            title: const Text("Mute Shop",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.block),
            title: const Text("Block Shop",
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
