import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/market_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../user_pages/post/new_post.dart';
import '../user_pages/store/create_store.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        shape: Border(
            bottom:
                BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Center(
                child: CircleAvatar(
                  radius: 17,
                  backgroundImage: AssetImage('assets/prof2.jpg'),
                ),
              )),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                    ),
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: buildMarketList(context),
                      );
                    });
              },
              icon: Icon(
                Feather.settings,
                color: AppColors.black,
                size: 22,
              )),
        ],
        title: const Text(
          'Marketplace',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: const [
          MarketPostWidget(
              name: "Viola Anderson",
              username: "@viola254",
              time: "",
              tag: "@africa",
              title: "Quality snaekers on sale",
              num: '2'),
          MarketPostWidget(
              name: "Mecky Allan",
              username: "@mecky12",
              time: "",
              tag: "@africa",
              title: "Quality snaekers on sale",
              num: '3')
        ]),
      ),
      //
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
              label: "New Post",
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
              label: "Create Shop",
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

  buildMarketList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.flag_outlined),
            title: const Text("Favourite Shop",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          const Divider(),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 13, color: AppColors.black),
                )),
          )
        ],
      ),
    );
  }
}
