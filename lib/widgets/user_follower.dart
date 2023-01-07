import 'package:amerixapp/model/userService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:toast/toast.dart';

import '../utils/app_colors.dart';

class FollowUser extends StatefulWidget {
  final String username;
  final String usertag;
  final String about;
  final String token;
  final int id;

  const FollowUser(
      {Key? key,
      required this.username,
      required this.usertag,
      required this.about,
      required this.token,
      required this.id})
      : super(key: key);

  @override
  State<FollowUser> createState() => _FollowUserState();
}

class _FollowUserState extends State<FollowUser> {
  bool isSelected = false;
  bool remove = false;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return remove == true
        ? const SizedBox()
        : ListTile(
            key: ValueKey(widget.username.length),
            isThreeLine: true,
            trailing: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(
                          color: isSelected == true
                              ? AppColors.AppTheme
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(200))),
                  backgroundColor: MaterialStateProperty.all(isSelected == true
                      ? Colors.transparent
                      : AppColors.AppTheme)),
              onPressed: () async {
                await UserServive.followUser(widget.token, widget.id);
                Toast.show("Followed successfully",
                    duration: 3,
                    gravity: Toast.bottom,
                    textStyle:
                        const TextStyle(fontSize: 14, color: Colors.white));
                if (isSelected == false) {
                  setState(() {
                    isSelected = true;
                    remove = true;
                  });
                } else {
                  setState(() {
                    isSelected = false;
                  });
                }
              },
              child: Text(
                isSelected == true ? "Unfollow" : 'Follow',
                style: TextStyle(
                    fontSize: 12,
                    color:
                        isSelected == true ? AppColors.black : AppColors.white),
              ),
            ),
            leading: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.black,
              child: Icon(
                Entypo.user,
                color: AppColors.irish,
                size: 14,
              ),
            ),
            title: Text(
              widget.username,
              style: const TextStyle(fontSize: 13),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.usertag,
                  style: TextStyle(
                      fontSize: 11, color: AppColors.grey.withOpacity(.4)),
                ),
                Text(
                  widget.about,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }
}

//
class FollowingUser extends StatelessWidget {
  final String username;
  final String usertag;
  final String about;
  const FollowingUser(
      {Key? key,
      required this.username,
      required this.usertag,
      required this.about})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      trailing: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor:
                MaterialStateProperty.all(AppColors.grey.withOpacity(.2))),
        onPressed: () {},
        child: Text(
          "Following",
          style: TextStyle(fontSize: 12, color: AppColors.AppTheme),
        ),
      ),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.black,
        child: Icon(
          Entypo.user,
          color: AppColors.irish,
          size: 14,
        ),
      ),
      title: Text(
        username,
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            usertag,
            style:
                TextStyle(fontSize: 11, color: AppColors.grey.withOpacity(.4)),
          ),
          Text(
            about,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
