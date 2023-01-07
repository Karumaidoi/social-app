import 'dart:convert';
import 'dart:io';
import 'package:amerixapp/model/userService.dart';
import 'package:http/http.dart' as http;
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../../model/userModel.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  File? image;
  String content = '';
  late Future<UserModel> myData;
  @override
  void initState() {
    myData = getUser();
    print(myData);
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

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FutureBuilder<UserModel>(
          future: myData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 23,
                          )),
                      const Spacer(),
                      TextButton(
                        onPressed: () async {
                          var token = await token_read();

                          await UserServive.uploadPost(image!, token, content);
                          //
                          Toast.show("Posted successfully",
                              duration: 3,
                              gravity: Toast.bottom,
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Colors.white));

                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                content.length < 3
                                    ? AppColors.grey.withOpacity(.4)
                                    : AppColors.AppTheme)),
                        child: Text(
                          "Post",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.grey.withOpacity(.4),
                      backgroundImage: snapshot.data!.profileimgUrl == ''
                          ? null
                          : NetworkImage(
                              'http://159.89.16.24/${snapshot.data!.profileimgUrl}'),
                      child: snapshot.data!.profileimgUrl != ''
                          ? null
                          : Icon(
                              Feather.user,
                              color: AppColors.black,
                              size: 19,
                            ),
                    ),
                    title: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          content = value;
                        });
                      },
                      maxLength: 280,
                      maxLines: 4,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "What are you thinking?",
                          hintStyle: TextStyle(
                            fontSize: 14,
                          )),
                    ),
                    subtitle: image == null
                        ? const SizedBox()
                        : Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 175,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(.4),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: FileImage(image!), fit: BoxFit.cover),
                            ),
                          ),
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.grey.withOpacity(.2),
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Row(children: [
            IconButton(
              onPressed: () {
                showOptionsDialog(context);
              },
              icon: const Icon(Ionicons.image),
            ),
            const Spacer(),
          ]),
        ),
      ),
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

  pickImage(ImageSource src) async {
    Navigator.of(context).pop();
    final imageS = await ImagePicker().pickImage(
        source: src,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    if (imageS == null) return;

    final imageTemporary = File(imageS.path);
    setState(() {
      image = imageTemporary;
    });
  }

  Future showOptionsDialog(context) {
    return showDialog(
        barrierDismissible: true,
        barrierColor: AppColors.black.withOpacity(.4),
        barrierLabel: "Choose to pick",
        context: context,
        builder: (context) {
          return SimpleDialog(
            // backgroundColor: Colors.white,
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Turing"),
            title: const Center(child: Text("Choose to pick an image")),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                child: const Center(child: Text("Gallery")),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                child: const Center(child: Text("Camera")),
              )
            ],
          );
        });
  }
}
