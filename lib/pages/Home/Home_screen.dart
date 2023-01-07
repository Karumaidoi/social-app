import 'dart:convert';

import 'package:amerixapp/model/postModel.dart';
import 'package:amerixapp/pages/user_pages/post/new_post.dart';
import 'package:amerixapp/pages/user_pages/store/create_store.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/post.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userModel.dart';
import '../user_pages/account/Notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<UserModel> myData;
  bool isOpen = false;
  String token = '';
  late Future<List<PostModel>> postData;

  @override
  void initState() {
    super.initState();
    postData = getPostData();
    print(postData);
  }

  //GET PEOPLE TO FOLLOW
  Future<List<PostModel>> getPostData() async {
    try {
      var token = await token_read();
      var response = await http.get(
        Uri.parse("http://159.89.16.24/api/v2/posts/list"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        // var jsonResponse = jsonDecode(response.body);
        List jsonResponse = jsonDecode(response.body)["data"]["posts"]["data"];
        print(jsonResponse);
        return jsonResponse.map((data) => PostModel.fromJson(data)).toList();
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    String time = '';
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          shape: Border(
              bottom:
                  BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.account_circle_outlined)),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(const NotificationPage(),
                      transition: Transition.cupertino);
                },
                icon: Badge(
                  padding: const EdgeInsets.all(4),
                  position: BadgePosition.topEnd(
                    top: -6,
                    end: -7,
                  ),
                  badgeColor: AppColors.AppTheme,
                  badgeContent: Text(
                    "9+",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Icon(
                    Feather.bell,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Amerix.png',
                height: 15,
              ),
            ],
          )),
      body: FutureBuilder<List<PostModel>>(
          future: postData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.AppTheme,
                backgroundColor: AppColors.grey.withOpacity(.4),
              ));
            }
            List<PostModel>? data = snapshot.data;
            return ListView.builder(
                reverse: true,
                physics: const BouncingScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: ((context, index) {
                  return PostWidget(
                    name: data[index].name,
                    username: data[index].userName,
                    time: '16 hrs',
                    tag: '',
                    title: data[index].postContent,
                    num: data[index].imageContent,
                    isVideo: false,
                    totalLikes: data[index].likesCount,
                    totalReplies: data[index].commentCount,
                    totalZooms: data[index].zoomCount,
                    userImage: data[index].profileimgUrl,
                    contentImage: data[index].imageContent,
                  );
                }));
          }),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor:
                  isOpen == false ? AppColors.AppTheme : AppColors.AppTheme,
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
          icon: isOpen == false ? Icons.add : Icons.close,
          children: [
            SpeedDialChild(
              onTap: () {
                Get.to(() => const NewPostPage(),
                    transition: Transition.cupertino);
              },
              label: "Post",
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              child: Icon(Feather.edit_3, color: AppColors.AppTheme),
            ),
            SpeedDialChild(
              onTap: () {
                Get.to(() => const CreateStorePage(),
                    transition: Transition.cupertino);
              },
              label: "Shop",
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              child: Icon(Icons.storefront, color: AppColors.AppTheme),
            ),
          ],
        ),
      ),
    );
  }

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
