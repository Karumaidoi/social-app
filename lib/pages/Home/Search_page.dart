import 'package:amerixapp/pages/user_pages/settings/Explore_settings.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../widgets/interests_chips.dart';
import '../../widgets/user_follower.dart';
import '../user_pages/post/new_post.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearching = false;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        shape: Border(
            bottom:
                BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
        backgroundColor: Colors.white,
        title: Container(
          height: 35,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: AppColors.grey.withOpacity(.1),
              border:
                  Border.all(width: 1, color: AppColors.grey.withOpacity(.2))),
          child: Center(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 100,
                child: TextField(
                    onTap: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w800),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Amerix",
                        hintStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500))),
              )
            ]),
          ),
        ),
        actions: [
          isSearching
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    Get.to(() => ExploreSettingsPage(),
                        transition: Transition.cupertino);
                  },
                  icon: const Icon(
                    Feather.settings,
                    size: 22,
                  )),
        ],
        leading: isSearching
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = false;
                  });
                },
                icon: const Icon(Feather.arrow_left))
            : IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.account_circle_outlined)),
      ),
      //
      body: isSearching
          ? buildSearch()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'Top story',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Stack(
                    children: [
                      Container(
                        height: 165,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(.2),
                            image: const DecorationImage(
                                image: AssetImage('assets/prof2.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 165,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(90, 10, 10, 14),
                              Color.fromARGB(40, 31, 32, 32),
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cricket',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                        fontSize: 13)),
                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Text(
                                      'ZIMvIND: Zimbabwe and India face-off in second ODI match',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          fontSize: 14)),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'Trending Stories',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //NEWS**
                  const NewsTile(
                    content:
                        'Covid-19 misinformation bolsters anti-vaccine movement.',
                    num: '3',
                    title: 'NEWS',
                  ),
                  const NewsTile(
                    content:
                        'Style elements are not supported by this library and the requested SVG may not render as intended.',
                    num: '2',
                    title: 'SPORTS',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const Divider(),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'Who to Follow',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const FollowUser(
                    username: "Nyamiaka Lenson",
                    usertag: '@justadreamer',
                    about: 'Why we sleep',
                    id: 2,
                    token: '',
                  ),
                ],
              ),
            ),
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
              onTap: () {
                Get.to(() => const NewPostPage(),
                    transition: Transition.cupertino);
              },
              label: "New Post",
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              child: Icon(Feather.edit_3, color: AppColors.AppTheme),
            )
          ],
        ),
      ),
    );
  }

  buildSearch() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Top searches",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 10,
            children: const [
              InterestChips(info1: "Food Friday"),
              InterestChips(info1: "Politics"),
              InterestChips(info1: "Memes"),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              const Text(
                "Recent searches",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Clear all",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              )
            ],
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Feather.search, size: 16),
            title: const Text(
              "Dark humour",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  size: 16,
                )),
          )
        ]),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String title;
  final String content;
  final String num;
  const NewsTile(
      {Key? key, required this.title, required this.content, required this.num})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () {},
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        subtitle: Text(
          content,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage('assets/prof${num}.jpg'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
