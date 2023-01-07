import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
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
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.AppTheme)),
                  child: Text(
                    "Comment",
                    style: TextStyle(color: AppColors.white, fontSize: 13),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Replying to ',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Turing",
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '@amerix',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppColors.AppTheme,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.grey.withOpacity(.4),
                child: Icon(
                  Feather.user,
                  color: AppColors.black,
                  size: 19,
                ),
              ),
              title: TextFormField(
                maxLength: 280,
                maxLines: 4,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your reply",
                    hintStyle: TextStyle(
                      fontSize: 14,
                    )),
              ),
            ),
          ],
        ),
      ),
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
            title: const Text("Choose to pick an image"),
            children: [
              SimpleDialogOption(
                onPressed: () {},
                child: const Text("Gallerly"),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: const Text("Camera"),
              )
            ],
          );
        });
  }
}
