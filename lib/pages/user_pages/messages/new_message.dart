import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: Border(
            bottom:
                BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
        title: const Text(
          'New message',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Next",
                style: TextStyle(color: AppColors.AppTheme, fontSize: 13),
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                            width: 1, color: AppColors.grey.withOpacity(.2))),
                    child: Center(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: const TextField(
                                  style: TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search for people",
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800))),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Followers",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: const [
                  MessageTile(
                      time: "20 Apr",
                      tag: 'You sent a photo',
                      num: '2',
                      username: '@Leim',
                      name: 'Lenny Mandela'),
                  MessageTile(
                      time: "20 Apr",
                      tag: 'You sent a photo',
                      num: '3',
                      username: '@Emmy',
                      name: 'Emmy Janet'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
class MessageTile extends StatelessWidget {
  final String time;
  final String tag;
  final String num;
  final String username;
  final String name;

  const MessageTile(
      {Key? key,
      required this.time,
      required this.tag,
      required this.num,
      required this.username,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/prof$num.jpg'),
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
        ],
      ),
      subtitle: Text(
        username,
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 11, color: AppColors.grey),
      ),
    );
  }
}
