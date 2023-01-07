 import 'dart:convert';

import 'package:amerixapp/pages/Home/Home_screen.dart';
import 'package:amerixapp/pages/Home/Safari_page.dart';
import 'package:amerixapp/pages/Home/Search_page.dart';
import 'package:amerixapp/pages/Home/market_page.dart';
import 'package:amerixapp/pages/Home/messages_screen.dart';
import 'package:amerixapp/pages/user_pages/account/bookmarks_page.dart';
import 'package:amerixapp/pages/user_pages/profile/profile_page.dart';
import 'package:amerixapp/pages/user_pages/settings.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userModel.dart';

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late Future<UserModel> myData;

  String profileImage = '';
  @override
  void initState() {
    myData = getUser();

    super.initState();
  }

  Future<UserModel> getUser() async {
    try {
      var token = await token_read();
      var userName = await userName_read();
      var response = await http.get(
        Uri.parse("http://159.89.16.24/api/v2/users/$userName"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse =
            UserModel.fromJson(jsonDecode(response.body)['data']['user']);

        return jsonResponse; //0708267513
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  int index = 0;
  List titles = [
    SvgPicture.asset(
      'assets/Amx.svg',
      height: 13,
    ),
    const Text(
      'Marketplace',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    const Text(
      'Safari',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    Container(
      height: 30,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(width: 1, color: AppColors.grey.withOpacity(.2))),
      child: Center(
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            width: 15,
          ),
          Icon(
            Feather.search,
            color: AppColors.grey.withOpacity(.5),
            size: 14,
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 100,
            height: 20,
            child: TextField(
                style: TextStyle(fontSize: 10),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Amerix",
                    hintStyle:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w300))),
          )
        ]),
      ),
    ),
    const Text(
      'Messages',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  ];
  List action = [
    Builder(builder: (context) {
      return IconButton(
          onPressed: () {},
          icon: const Icon(
            Feather.bell,
          ));
    }),
    IconButton(
        onPressed: () {},
        icon: Icon(
          Feather.search,
          color: AppColors.black,
          size: 22,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Feather.search,
          size: 22,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Feather.settings,
          size: 22,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Feather.settings,
          size: 22,
        )),
  ];
  List screens = [
    const HomePage(),
    const MarketScreen(),
    const SafariPage(),
    const SearchPage(),
    const MessageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: drawerWidget(context),
      body: screens[index],
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
              icon: index == 0
                  ? SvgPicture.asset('assets/Home Icon.svg',
                      color: AppColors.AppTheme, height: 30, width: 30)
                  : SvgPicture.asset('assets/Home Icon 2.svg',
                      color: AppColors.grey, height: 30, width: 30),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              icon: index == 1
                  ? SvgPicture.asset('assets/Market 1.svg',
                      color: AppColors.AppTheme, height: 24, width: 24)
                  : SvgPicture.asset('assets/Market2.svg',
                      color: AppColors.grey, height: 24, width: 24),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
              icon: index == 2
                  ? SvgPicture.asset('assets/Safari Icon Black.svg',
                      color: AppColors.AppTheme, height: 35, width: 35)
                  : SvgPicture.asset('assets/Safari Icon Blue.svg',
                      color: AppColors.grey, height: 35, width: 35),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  index = 3;
                });
              },
              icon: index == 3
                  ? const Icon(Feather.search, color: Colors.blue, size: 28)
                  : Icon(Feather.search, color: AppColors.grey, size: 28),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  index = 4;
                });
              },
              icon: index == 4
                  ? const Icon(Feather.mail, color: Colors.blue, size: 28)
                  : Icon(Feather.mail, color: AppColors.grey, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  Drawer drawerWidget(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.white,
        width: MediaQuery.of(context).size.width * 0.85,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: FutureBuilder<UserModel>(
            future: myData,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              }
              return ListView(
                children: [
                  DrawerHeader(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          snapshot.data!.profileimgUrl == ''
                              ? Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/${snapshot.data!.gender}.svg'))
                              : Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: AppColors.AppTheme,
                                    borderRadius: BorderRadius.circular(200),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'http://159.89.16.24/${snapshot.data!.profileimgUrl}')),
                                  )),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          snapshot.data!.first_name,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "@${snapshot.data!.username}",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ),

                      //

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshot.data!.totalFollowings.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Following',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),

                            const SizedBox(
                              width: 15,
                            ),

                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.totalFollowers.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Followers',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),

                  //
                  ListTile(
                    onTap: () {
                      Get.to(const ProfilePage(),
                          transition: Transition.cupertino);
                    },
                    leading: const Icon(
                      Icons.account_circle_outlined,
                      size: 22,
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const BookmarksPage();
                      }));
                    },
                    leading: const Icon(
                      Feather.bookmark,
                      size: 22,
                    ),
                    title: const Text(
                      "Bookmark",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SettingsPage();
                      }));
                    },
                    leading: const Icon(
                      Feather.settings,
                      size: 22,
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  const Divider(),
                ],
              );
            })));
  }

  //
  token_read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'token';
    var read_value = prefs.getString(key) ?? 0;

    return read_value;
  }

  //
  userName_read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'username';
    var read_value = prefs.getString(key) ?? 0;
    return read_value.toString();
  }
}
