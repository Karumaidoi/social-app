import 'package:amerixapp/pages/user_pages/messages/chat_page.dart';
import 'package:amerixapp/pages/user_pages/messages/new_message.dart';
import 'package:amerixapp/pages/user_pages/settings/Message_setrings.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../user_pages/messages/message_requests.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      //
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: Border(
            bottom:
                BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
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
                width: 150,
                child: TextField(
                    onTap: () {},
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w800),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Messages",
                        hintStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500))),
              )
            ]),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => MessageSettingsPage(),
                    transition: Transition.cupertino);
              },
              icon: const Icon(
                Feather.settings,
                size: 22,
              )),
        ],
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.account_circle_outlined)),
      ),
      //

      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              Get.to(const MessageRequests(), transition: Transition.cupertino);
            },
            leading: const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Feather.git_pull_request,
                      color: Colors.white,
                    ),
                  )),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            title:
                const Text("Message requests", style: TextStyle(fontSize: 12)),
            subtitle: const Text("Check your message requets",
                style: TextStyle(fontSize: 12)),
          ),
          const MessageTile(
            time: "20 Apr",
            tag: 'You sent a photo',
            num: '2',
            username: '@Leim',
            name: 'Lenny Mandela',
            chatStart: true,
          ),
          const MessageTile(
            time: "12 Apr",
            tag: 'You sent a photo',
            num: '3',
            username: '@Emmy',
            name: 'Emmy Janet',
            chatStart: false,
          ),
          const MessageTile(
            time: "13 Jan",
            tag: 'You sent a photo',
            num: '2',
            username: '@Leim',
            name: 'Lenny Mandela',
            chatStart: false,
          ),
          const MessageTile(
            time: "11 Feb",
            tag: 'You sent a photo',
            num: '2',
            username: '@Amerix',
            name: 'Eric Amerix',
            chatStart: true,
          ),
          const MessageTile(
              chatStart: true,
              time: "20 Apr",
              tag: 'You sent a photo',
              num: '2',
              username: '@Leim',
              name: 'Lenny Mandela'),
        ]),
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: AppColors.AppTheme,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200)),
                largeSizeConstraints:
                    const BoxConstraints.tightFor(width: 60, height: 60)),
          ),
          child: FloatingActionButton(
            onPressed: () {
              Get.to(NewMessage(), transition: Transition.cupertino);
            },
            child: const Icon(Feather.mail),
          )),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String time;
  final String tag;
  final String num;
  final String username;
  final String name;
  final bool chatStart;

  const MessageTile(
      {Key? key,
      required this.time,
      required this.tag,
      required this.num,
      required this.username,
      required this.name,
      required this.chatStart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
            ChatPage(
              image: 'assets/prof$num.jpg',
              chatStarted: chatStart,
              name: name,
              username: username,
            ),
            transition: Transition.cupertino);
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/prof$num.jpg'),
      ),
      trailing: Text(
        time,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
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
          Text(
            username,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          ),
        ],
      ),
      subtitle: Text(
        tag,
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 11, color: AppColors.grey),
      ),
    );
  }
}
