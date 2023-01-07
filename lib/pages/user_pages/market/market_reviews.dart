import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MarketReviews extends StatelessWidget {
  const MarketReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Sneakers",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  //
                  Row(
                    children: [
                      Icon(Icons.star,
                          size: 14, color: AppColors.grey.withOpacity(.3)),
                      Text(
                        "4.7",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: AppColors.grey.withOpacity(.3)),
                      )
                    ],
                  ),
                ],
              ),
              const Text(
                "Ratings and Reviews",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          shape: Border(
              bottom:
                  BorderSide(width: 1, color: AppColors.grey.withOpacity(.2))),
          bottom: TabBar(
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              labelColor: AppColors.AppTheme,
              unselectedLabelColor: AppColors.black,
              labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Turing"),
              tabs: <Widget>[
                const Tab(
                  text: 'All',
                ),
                Tab(
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text(
                      "5",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                  ]),
                ),
                Tab(
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text(
                      "4",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                  ]),
                ),
                Tab(
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text(
                      "3",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                  ]),
                ),
                Tab(
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text(
                      "2",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                  ]),
                ),
              ]),
        ),

        //
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: const [
                ReviewWidget(),
                ReviewWidget(),
                ReviewWidget(),
              ],
            ),
          ),
          const SingleChildScrollView(
              child: Center(child: Text("No reviews yet"))),
          const SingleChildScrollView(),
          SingleChildScrollView(
              child: Column(
            children: const [
              ReviewWidget(),
            ],
          )),
          const SingleChildScrollView(),
        ]),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.grey.withOpacity(.4),
            child: const Icon(
              Entypo.user,
              size: 13,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Nyamiaka",
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Icon(
                Icons.star,
                size: 13,
                color: AppColors.AppTheme,
              ),
              Icon(
                Icons.star,
                size: 13,
                color: AppColors.AppTheme,
              ),
              Icon(
                Icons.star,
                size: 13,
                color: AppColors.AppTheme,
              ),
              const SizedBox(width: 5),
              const Text(
                "3/12/2022",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "You can purchase all your mobile phones, tablets, computers & laptops, women's fashion, have them delivered to you.",
            style: TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }
}
