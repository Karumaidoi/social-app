import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ChatPage extends StatelessWidget {
  final String image;
  final String name;
  final String username;
  final bool chatStarted;
  const ChatPage(
      {Key? key,
      required this.image,
      required this.name,
      required this.username,
      required this.chatStarted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shape: Border(
              bottom:
                  BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
          title: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    username,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: AppColors.grey),
                  ),
                ],
              )
            ],
          ),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: 1,
                          child: Text(
                            'Search',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          )),
                      const PopupMenuItem(
                          value: 2,
                          child: Text(
                            'Dissapearing messages',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          )),
                      const PopupMenuItem(
                          value: 3,
                          child: Text(
                            'Block @Lenny',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          )),
                      const PopupMenuItem(
                          value: 4,
                          child: Text(
                            'Delete',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          )),
                      const PopupMenuItem(
                          value: 5,
                          child: Text(
                            'Archive',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          )),
                    ])
            // IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Feather.more_vertical,
            //       size: 22,
            //     )),
          ],
        ),
        //
        body: !chatStarted
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/Chat.svg',
                        height: 45,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Start a Conversation",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ]),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          SvgPicture.asset(
                            'assets/Chat.svg',
                            height: 45,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Mon, 4 July",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Flexible(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7),
                            child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.AppTheme,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Hello Alex.\n I would like you to know if it would be possible to pay a visit.",
                                      style: TextStyle(
                                          color: AppColors.white, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        Text(
                                          "21:34",
                                          style:
                                              TextStyle(color: AppColors.white),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.7),
                                child: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.black.withOpacity(.1),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Am fine. i'll request permisson then talk to you Nelson!✋🤞.",
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Text(
                                              "21:34",
                                              style: TextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(.5)),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: Container(
          height: 100,
          width: double.maxFinite,
          // color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                    minHeight: 35,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // height: 35,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            width: 1, color: AppColors.black.withOpacity(.1)),
                        borderRadius: BorderRadius.circular(200)),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.emoji_emotions_outlined,
                            color: AppColors.AppTheme,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: TextFormField(
                              maxLength: 85,
                              maxLines: null,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w300),
                              decoration: const InputDecoration(
                                counterText: "",
                                hintText: "Type Message",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                            )),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showOptionsDialog(context);
                          },
                          child: Icon(
                            Icons.image_outlined,
                            color: AppColors.AppTheme,
                            size: 19,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            showOptionsDialog(context);
                          },
                          child: Icon(
                            Icons.file_copy_outlined,
                            color: AppColors.AppTheme,
                            size: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send))
            ],
          ),
        ));
  }

  //
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
