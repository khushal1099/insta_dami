import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_dami/view/profile/post_section.dart';

import '../../utils/ListUtils.dart';
import '../home/story_section.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  RxBool isShowMore = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              floating: true,
              snap: true,
              title: Row(
                children: [
                  Text(
                    "Cipher Craft",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 28,
                  ),
                  SizedBox(width: 2),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.alternate_email,
                        size: 33,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            "7",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_box_outlined,
                    size: 33,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    size: 33,
                  ),
                ),
              ],
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 8,
            right: 8,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          AppBorderWidget(
                            size: 95,
                            borderWidth: 12,
                            imageUrl: "assets/images/car1.jpg",
                          ),
                          Positioned(
                            right: 9.2,
                            bottom: 8.2,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                border:
                                    Border.all(color: Colors.black, width: 3),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 11,
                            bottom: 55,
                            child: Container(
                              height: 40,
                              width: 75,
                              decoration: BoxDecoration(
                                color: Color(0xff262626),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "Note...",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ProfileWidget(
                        number: '7',
                        text: 'posts',
                      ),
                      ProfileWidget(
                        number: '788',
                        text: 'followers',
                      ),
                      ProfileWidget(
                        number: '532',
                        text: 'following',
                      ),
                    ],
                  ),
                  Text(
                    "Cipher Craft",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff262626),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.alternate_email,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Flutter Development",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Web Development",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Graphics Design",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Obx(
                        () => TextButton(
                            onPressed: () {
                              isShowMore.value = true;
                            },
                            child: isShowMore.value == false
                                ? Text(
                                    "...more",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : SizedBox.shrink()),
                      ),
                    ],
                  ),
                  Obx(
                    () => isShowMore.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SEO & SMO",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Web base Application",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff262626),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Professional dashboard",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "256 accounts reaches in the last 30 days.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(vertical: 7),
                            width: 180,
                            decoration: BoxDecoration(
                              color: Color(0xff262626),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            width: 180,
                            decoration: BoxDecoration(
                              color: Color(0xff262626),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Share profile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 131,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        var data = messageList[index];
                        return Highlights(
                          size: 90,
                          borderWidth: 7,
                          imageUrl: data["image"].toString(),
                          highlightname: data["name"].toString(),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PostSection()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String number;
  final String text;

  const ProfileWidget({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class Highlights extends StatelessWidget {
  final double size;
  final Widget? child;
  final double borderWidth;
  final String imageUrl;
  final String highlightname;

  const Highlights(
      {super.key,
      required this.size,
      this.child,
      required this.borderWidth,
      required this.imageUrl,
      required this.highlightname});

  @override
  Widget build(BuildContext context) {
    double innerContainerSize = size - borderWidth;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Container(
              width: innerContainerSize,
              height: innerContainerSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 4,
                ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 1),
        Text(
          highlightname,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
