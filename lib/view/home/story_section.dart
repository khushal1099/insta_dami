import 'package:flutter/material.dart';
import '../../utils/ListUtils.dart';
import '../../utils/SizeUtils.dart';


class StorySection extends StatefulWidget {
  const StorySection({super.key});

  @override
  State<StorySection> createState() => _StorySectionState();
}

class _StorySectionState extends State<StorySection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 122,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              var data = messageList[index];
              return StoryWidget(
                data: data,
              );
            },
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: details.length,
          itemBuilder: (context, index) {
            var data = details[index];
            if (data["type"] == "1") {
              return Column(
                children: [
                  Container(
                    height: 50,
                    color: Colors.white12,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Suggested for you",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        var data = messageList[index];
                        return Stack(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 7, left: 3, right: 3),
                              height: SizeUtils.height * 0.38,
                              width: SizeUtils.width * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage("${data["image"]}"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${data["name"]}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            clipBehavior: Clip.antiAlias,
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                                data['image'].toString()),
                                          ),
                                          Container(
                                            clipBehavior: Clip.antiAlias,
                                            height: 30,
                                            width: 30,
                                            margin: EdgeInsets.only(
                                              top: 10,
                                              left: 20,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              data['image'].toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: Text(
                                            "Followed by Mini Cooper,Rolls Royce and Range Rover...",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    height: SizeUtils.height * 0.050,
                                    width: SizeUtils.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Follow",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 15,
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Container(
              width: SizeUtils.width * 1,
              height: SizeUtils.height * 0.7251,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      width: SizeUtils.width * 0.10,
                      height: SizeUtils.height * 0.10,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.purple],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: SizeUtils.width * 0.085,
                          height: SizeUtils.height * 0.085,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("${data["image"]}"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "${data["name"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "${data["bio"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Stack(
                              children: [
                                Container(
                                  width: SizeUtils.width * 1,
                                  height: SizeUtils.height * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(28),
                                      topRight: Radius.circular(28),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.18,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.save_rounded,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.18,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.add_to_home_screen,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.18,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.qr_code_scanner,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 0.001,
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        minVerticalPadding: 20,
                                        leading: Icon(
                                            Icons.visibility_off_outlined,
                                            size: 30,
                                            color: Colors.white),
                                        title: Text(
                                          "Hide",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ),
                                      ListTile(
                                        minVerticalPadding: 20,
                                        leading: Icon(
                                            Icons.account_circle_outlined,
                                            size: 30,
                                            color: Colors.white),
                                        title: Text(
                                          "About this comment",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ),
                                      ListTile(
                                        minVerticalPadding: 20,
                                        leading: Icon(
                                            Icons.report_gmailerrorred,
                                            size: 30,
                                            color: Colors.red),
                                        title: Text(
                                          "Report",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 25),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 49,
                                  top: 115,
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 180,
                                  top: 115,
                                  child: Text(
                                    "Remix",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 310,
                                  top: 115,
                                  child: Text(
                                    "QR code",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: SizeUtils.height * 0.43,
                    width: SizeUtils.width * 1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("${data["image"]}"),
                        ),
                        color: Colors.black54),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment_sharp,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.save,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data["likes"]} likes",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        RichText(
                          maxLines: 2,
                          text: TextSpan(
                            text: "${data["name"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "  Flutter Developer Flutter Developer Flutter Developer Flutter Developer....",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "View all ${data["comments"]} comments",
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "${data["published day"]} day ago",
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class StoryWidget extends StatelessWidget {
  final Map<String, String> data;

  const StoryWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBorderWidget(
            imageUrl: data["image"].toString(),
            size: 100,
            borderWidth: 12,
          ),
          SizedBox(height: 2),
          Text(
            "${data["name"]}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AppBorderWidget extends StatelessWidget {
  final double size;
  final Widget? child;
  final double borderWidth;
  final String? imageUrl;

  const AppBorderWidget({
    super.key,
    this.size = 50,
    this.child,
    this.borderWidth = 5,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    double innerContainerSize = size - borderWidth;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(
          colors: [Colors.yellow, Colors.purple],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
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
          ),
          child: imageUrl != null
              ? Image.asset(imageUrl!)
              : child ?? const SizedBox(),
        ),
      ),
    );
  }
}
