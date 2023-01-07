import 'dart:convert';

import 'package:amerixapp/model/followersModel.dart';
import 'package:amerixapp/pages/Auth/interests_page.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/user_follower.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/userService.dart';
import '../../widgets/amerix_icon.dart';
import '../../widgets/button.dart';
import 'package:http/http.dart' as http;

class FollowPage extends StatefulWidget {
  final String BearerToken;
  const FollowPage({Key? key, required this.BearerToken}) : super(key: key);

  @override
  State<FollowPage> createState() => _FollowPageState();
}

  late Future<List<FollowerModel>> myData;
class _FollowPageState extends State<FollowPage> {
  @override
  void initState() {
    super.initState();
    myData = fetchData();
  }

  //
  Future<List<FollowerModel>> fetchData() async {
    final response = await http.get(
      Uri.parse("http://159.89.16.24/api/v2/users/to-follow"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Bearer ${widget.BearerToken}",
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)["data"]["users"]["data"];
      return jsonResponse.map((data) => FollowerModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AmerixIcon(),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  "Follow at least 2 accounts",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text:
                        'When you follow someone, you will see their posts in your timeline',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Turing',
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Popular on Amerix",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              //
              const SizedBox(
                height: 15,
              ),
              FutureBuilder<List<FollowerModel>>(
                  future: myData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<FollowerModel>? data = snapshot.data;
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return FollowUser(
                                username: data[index].first_name,
                                usertag: data[index].username,
                                about: '',
                                id: data[index].id,
                                token: widget.BearerToken,
                              );
                            }),
                      );
                    }

                    return const SizedBox();
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        child: ButtonWidget(
            info: "Continue",
            onClick: () {
              Get.to(
                  () => InterestPage(
                        token: widget.BearerToken,
                      ),
                  transition: Transition.cupertino);
            }),
      ),
    );
  }
}
