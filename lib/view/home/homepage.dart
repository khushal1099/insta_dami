import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_dami/view/home/story_section.dart';

import '../../utils/SizeUtils.dart';
import '../messages/chat_list.dart';
import '../profile/profile_detail.dart';
import '../reels/reels_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SizeUtils.config();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(
                "Instagram",
                style: TextStyle(color: Colors.white),
              ),
              automaticallyImplyLeading: false,
              expandedHeight: 50,
              floating: true,
              snap: true,
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Icon(Icons.favorite_border,
                            size: 35, color: Colors.white),
                      ),
                      Positioned(
                        top: 10,
                        right: 0,
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(
                      () => MainPage(),
                      transition: Transition.cupertino,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                  icon: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: 3,
                        child: Container(
                          width: SizeUtils.width * 0.040,
                          height: SizeUtils.height * 0.040,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ];
        },
        body: StorySection(),
      ),
      bottomNavigationBar: Container(
        width: SizeUtils.width * 0.080,
        height: SizeUtils.height * 0.080,
        decoration: BoxDecoration(
            // color: Colors.black,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_filled,
                size: 35,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 35,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outline_sharp,
                size: 35,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(
                      () => ReelsPage(),
                  transition: Transition.cupertino,
                  duration: Duration(milliseconds: 500),
                );
              },
              icon: Icon(
                Icons.movie_outlined,
                size: 35,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(
                  () => ProfileDetails(),
                  transition: Transition.cupertino,
                  duration: Duration(milliseconds: 500),
                );
              },
              icon: Icon(
                Icons.account_circle_outlined,
                size: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
