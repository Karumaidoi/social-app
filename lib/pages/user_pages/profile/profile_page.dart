import 'dart:convert';

import 'package:amerixapp/pages/user_pages/profile/Edit_profile.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/userModel.dart';
import '../../../model/user_details.dart';
import '../../../widgets/post.dart';
import 'package:http/http.dart' as http;
import 'follow_ing_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late Future<UserDetails> myData;

  @override
  void initState() {
    super.initState();
    TabController _tabBarController = TabController(length: 3, vsync: this);
    myData = getUser();
    print(myData);
  }

  Future<UserDetails> getUser() async {
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
            UserDetails.fromJson(jsonDecode(response.body)['data']['user']);

        print(jsonResponse);
        return jsonResponse;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabBarController = TabController(length: 3, vsync: this);
    return Scaffold(
      extendBodyBehindAppBar: true,

      backgroundColor: AppColors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          accountInfo(context),
          const SizedBox(
            height: 20,
          ),
          TabBar(
              physics: const BouncingScrollPhysics(),
              labelColor: AppColors.AppTheme,
              unselectedLabelColor: AppColors.black,
              labelStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              controller: _tabBarController,
              tabs: const [
                Text(
                  "Post",
                  style: TextStyle(fontFamily: "Turing"),
                ),
                Text("Activity", style: TextStyle(fontFamily: "Turing")),
                Text("Pins", style: TextStyle(fontFamily: "Turing"))
              ]),
          //
          Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8, right: 0),
              child: SizedBox(
                height: 500,
                width: double.infinity,
                child: TabBarView(controller: _tabBarController, children: [
                  ListView(
                    children: const [
                      PostWidget(
                        name: 'Nelly Mandela',
                        tag: '#africa',
                        time: '',
                        title: 'King of JUNGLE',
                        username: '@cardano',
                        contentImage: '',
                        num: '3',
                        isVideo: false,
                        totalLikes: 0,
                        totalReplies: 0,
                        totalZooms: 0,
                        userImage: '',
                      ),
                      PostWidget(
                        userImage: '',
                        name: 'Nelly Mandela',
                        tag: '#africa',
                        time: '',
                        title: 'King of JUNGLE',
                        username: '@cardano',
                        num: '3',
                        isVideo: false,
                        totalLikes: 0,
                        totalReplies: 0,
                        totalZooms: 0,
                        contentImage: '',
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(children: [
                            Icon(
                              Icons.loop,
                              color: AppColors.AppTheme,
                              size: 14,
                            ),
                            Text(
                              "Zoomed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey.withOpacity(.5)),
                            )
                          ]),
                        ),
                        const PostWidget(
                            name: 'Nelly Mandela',
                            tag: '#africa',
                            contentImage: '',
                            time: '',
                            title: 'King of JUNGLE',
                            username: '@cardano',
                            num: '2',
                            isVideo: false,
                            totalLikes: 0,
                            totalReplies: 0,
                            totalZooms: 0,
                            userImage: ''),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(children: [
                            Icon(
                              CupertinoIcons.pin,
                              color: AppColors.AppTheme,
                              size: 14,
                            ),
                            Text(
                              "Pinned",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey.withOpacity(.5)),
                            )
                          ]),
                        ),
                        const PostWidget(
                            name: 'Nelly Mandela',
                            tag: '#africa',
                            time: '',
                            title: 'King of JUNGLE',
                            username: '@cardano',
                            num: '2',
                            isVideo: false,
                            totalLikes: 0,
                            totalReplies: 0,
                            totalZooms: 0,
                            contentImage: '',
                            userImage: ''),
                      ],
                    ),
                  )
                ]),
              ))
        ],
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
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Ionicons.add),
          )),
    );
  }

  SingleChildScrollView accountInfo(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: FutureBuilder<UserDetails>(
          future: myData,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }
            return Column(children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: AppColors.AppTheme.withOpacity(.4),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      image: snapshot.data!.profileimg_url != ''
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'http://159.89.16.24/${snapshot.data!.backgroundUrl}'))
                          : null,
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    bottom: -40,
                    left: 20,
                    child: CircleAvatar(
                      backgroundImage: snapshot.data!.profileimg_url != ''
                          ? NetworkImage(
                              'http://159.89.16.24/${snapshot.data!.profileimg_url}')
                          : null,
                      radius: 40,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Feather.arrow_left,
                                color: AppColors.white,
                              )),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const EditProfile(),
                      transition: Transition.cupertino);
                },
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(fontSize: 10, color: AppColors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              //
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          snapshot.data!.first_name,
                          style: const TextStyle(fontSize: 13),
                        ),
                        subtitle: Text(
                          "@${snapshot.data!.username}",
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                      snapshot.data!.bio == ''
                          ? const SizedBox()
                          : const SizedBox(
                              height: 10,
                            ),
                      snapshot.data!.bio == ''
                          ? const SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(children: [
                                Text(
                                  snapshot.data!.bio,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ]),
                            ),
                      snapshot.data!.bio == ''
                          ? const SizedBox()
                          : const SizedBox(
                              height: 20,
                            ),
                    ],
                  ))
            ]);
          })),
      //
    );
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
