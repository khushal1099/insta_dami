import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

import '../../controller/search_controller.dart';
import '../../utils/AppBarUtils.dart';
import '../../utils/ListUtils.dart';
import '../home/story_section.dart';
import 'chat_details.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Searchcontroller controller = Get.put(Searchcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Appbar(
        icons: [
          AppBarIconButton(icon: Icons.select_all_outlined),
          AppBarIconButton(icon: Icons.trending_up),
          AppBarIconButton(icon: Icons.edit_note_outlined),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    controller.searchuser(value);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    filled: true,
                    fillColor: Color(0xff262626),
                    isDense: true,
                    hintText: "Search",
                    constraints: BoxConstraints(maxHeight: 50),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Filter",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                var data = messageList[index];
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset(
                            data["image"].toString(),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Color(0xff262626),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Marquee(
                                    text: " ${data["name"]}",
                                    style: TextStyle(color: Colors.white),
                                    pauseAfterRound:
                                        const Duration(milliseconds: 1000),
                                  ),
                                ),
                                Text(
                                  "${data["bio"]}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${data["name"]}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            children: [
              SectionName(
                name: 'Primary',
                color: Colors.white,
                fontcolor: Colors.black,
              ),
              SectionName(
                name: 'General',
                color: Color(0xff262626),
                fontcolor: Colors.white,
              ),
              SectionName(
                name: 'Channels',
                color: Color(0xff262626),
                fontcolor: Colors.white,
              ),
              SectionName(
                name: 'Requests',
                color: Color(0xff262626),
                fontcolor: Colors.white,
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.searchList.length,
                itemBuilder: (context, index) {
                  var data = controller.searchList[index];
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => ChatDetails(),
                        arguments: {
                          "name": data["name"],
                          "image": data["image"],
                          "published day": data["published day"],
                        },
                        transition: Transition.cupertino,
                        duration: Duration(milliseconds: 500),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: AppBorderWidget(
                              imageUrl: data["image"],
                              size: 70,
                              borderWidth: 8,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data["name"]}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${data["bio"]} - ${data["published day"]}h",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionName extends StatelessWidget {
  final String name;
  final Color color;
  final Color fontcolor;

  const SectionName(
      {super.key,
      required this.name,
      required this.color,
      required this.fontcolor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: fontcolor, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
