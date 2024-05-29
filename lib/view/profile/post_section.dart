import 'package:flutter/material.dart';

import '../../utils/ListUtils.dart';

class PostSection extends StatefulWidget {
  const PostSection({super.key});

  @override
  State<PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 51,
                width: 100,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.border_all_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      height: 3,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 51,
                width: 100,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.movie_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 51,
                width: 100,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_pin_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 471,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              var data = messageList[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      data["image"].toString(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
