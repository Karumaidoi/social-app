import 'dart:async';

import 'package:amerixapp/model/userService.dart';
import 'package:amerixapp/pages/Main_Home/main_home.dart';
import 'package:amerixapp/utils/app_colors.dart';
import 'package:amerixapp/widgets/button.dart';
import 'package:amerixapp/widgets/interests_chips.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/amerix_icon.dart';

class InterestPage extends StatefulWidget {
  final String token;
  const InterestPage({Key? key, required this.token}) : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  int counter = 0;
  bool isActive = false;

  @override
  void initState() {
    // getCounter();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      setState(() {});
      setState(() {
        isActive = true;
      });
    });
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
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
                height: 50,
              ),
              const Center(
                child: Text(
                  "Interests",
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
                        'Choose at least 2 categories that interests you for better recommendations',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Turing',
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Mind",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Tapped');
                    },
                    child: ChipWidget(
                      info: "Mental Health",
                      id: 1,
                      token: widget.token,
                    ),
                  ),
                  ChipWidget(
                    info: "Books",
                    id: 2,
                    token: widget.token,
                  ),
                  ChipWidget(
                    info: "Inspiration",
                    id: 3,
                    token: widget.token,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Philosophy",
                      id: 4,
                      token: widget.token,
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 18,
              ),
              //
              const Text(
                "Money",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Finance",
                      id: 5,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Business",
                      id: 6,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Stocks",
                      id: 7,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Budget",
                      id: 8,
                      token: widget.token,
                    ),
                  )
                ],
              ),

              //
              const SizedBox(
                height: 18,
              ),
              //
              const Text(
                "Men",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Culture",
                      id: 9,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Society",
                      id: 10,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Sports",
                      id: 11,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Political Science",
                      id: 12,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Politics",
                      id: 13,
                      token: widget.token,
                    ),
                  ),
                ],
              ),

              //
              //
              const SizedBox(
                height: 18,
              ),
              //
              const Text(
                "Muscle",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                        print(counter);
                      });
                    },
                    child: ChipWidget(
                      info: "Nutrition",
                      id: 14,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Health",
                      id: 15,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Reproduction",
                      id: 16,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Fitness",
                      id: 17,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Sports",
                      id: 18,
                      token: widget.token,
                    ),
                  ),
                ],
              ),
              //
              const SizedBox(
                height: 18,
              ),
              //
              const Text(
                "Material",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Investment",
                      id: 19,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Asset",
                      id: 20,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Agriculture",
                      id: 21,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: ChipWidget(
                      info: "Land",
                      id: 22,
                      token: widget.token,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter += 2;
                        print(counter);
                      });
                    },
                    child: ChipWidget(
                      info: "Wealth",
                      id: 23,
                      token: widget.token,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: isActive == false
          ? Container(
              margin: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                          width: 1, color: AppColors.grey.withOpacity(.2))),
                  child: Center(
                    child: Text(
                      'Join Amerix',
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ),
              ))
          : Container(
              margin: const EdgeInsets.all(15),
              child: ButtonWidget(
                  info: "Join Amerix",
                  onClick: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return MainHome();
                    }));
                  }),
            ),
    );
  }
}
