import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/bookmark.dart';
import 'package:amerixapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "Bookmarks",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {},
                leading: const CircleAvatar(
                  child: Center(
                      child: Icon(
                    Ionicons.bookmarks,
                    size: 19,
                  )),
                ),
                title: const Text(
                  "All Bookmarks",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.to(() => const BookmarkPost(),
                      transition: Transition.cupertino);
                },
                leading: CircleAvatar(
                  backgroundColor: AppColors.greenish,
                  child: const Center(
                      child: Icon(
                    Ionicons.bookmark,
                    size: 19,
                  )),
                ),
                title: const Text(
                  "Masculinity",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )),
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: AppColors.red,
                  child: const Center(
                      child: Icon(
                    Ionicons.bookmark,
                    size: 19,
                  )),
                ),
                title: const Text(
                  "Fitness",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )),
              ),
            ), //

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: AppColors.AppTheme,
                  child: const Center(
                      child: Icon(
                    Ionicons.bookmark,
                    size: 19,
                  )),
                ),
                title: const Text(
                  "Books",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: AppColors.AppTheme,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              largeSizeConstraints:
                  const BoxConstraints.tightFor(width: 100, height: 100)),
        ),
        child: SpeedDial(
          overlayColor: AppColors.black,
          overlayOpacity: 0.8,
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
                showSheet(context);
              },
              label: "Create Folder",
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(Feather.edit_3, color: AppColors.AppTheme),
            ),
          ],
        ),
      ),
    );
  }

  Future showSheet(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColors.white,
            child: Container(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 15),
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Folder',
                        style: TextStyle(
                            color: Colors.grey[850],
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextFieldWidget(
                          content: "Untitled folder",
                          show: false,
                          suffixIcon: true),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text('Cancel',
                                  style: TextStyle(color: AppColors.AppTheme))),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text('Create',
                                  style: TextStyle(color: AppColors.AppTheme))),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
