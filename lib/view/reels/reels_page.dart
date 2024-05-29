import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_dami/view/reels/video_page.dart';

import '../../utils/ListUtils.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  int cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              "Reels",
              style: TextStyle(
                color: Colors.white,
                fontSize: 29,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 698.03,
            width: double.infinity,
            color: Colors.grey,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: videoList.length,
              onPageChanged: (value) {
                setState(() {
                  cIndex = value;
                });
              },
              itemBuilder: (context, index) {
                var data = videoList[index];
                return VideoPage(
                  url: data["video"].toString(),
                  name: data["name"].toString(),
                  image: data["image"].toString(),
                  like: data["likes"].toString(),
                  comment: data["comments"].toString(),
                  share: data["share"].toString(),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 51,
        decoration: BoxDecoration(
          color: Colors.black,
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
                // Get.to(
                //       () => ProfileDetails(),
                //   transition: Transition.cupertino,
                //   duration: Duration(milliseconds: 500),
                // );
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
