import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:marquee/marquee.dart';
import 'package:video_player/video_player.dart';

import '../home/story_section.dart';

class VideoPage extends StatefulWidget {
  final String url;
  final String name;
  final String image;
  final String like;
  final String comment;
  final String share;

  const VideoPage(
      {super.key,
      required this.url,
      required this.name,
      required this.image,
      required this.like,
      required this.comment,
      required this.share});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    initializePlayer(widget.url);
  }

  void initializePlayer(String url) async {
    final fileinfo = await checkCacheFor(url);
    if (fileinfo == null) {
      controller = VideoPlayerController.asset(url);
      controller!.initialize().then((value) {
        cachedForUrl(url);
        setState(() {
          controller!.play();
          controller?.setLooping(true);
        });
      });
    } else {
      final file = fileinfo.file;
      controller = VideoPlayerController.file(file);
      controller!.initialize().then((value) {
        setState(() {
          controller!.play();
          controller!.setLooping(true);
        });
      });
    }
  }

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {
      print('Download successfully done for $url');
    });
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller == null
        ? Center(child: CircularProgressIndicator())
        : controller!.value.isInitialized
            ? Stack(
                children: [
                  Container(
                    height: 698.03,
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: controller!.value.aspectRatio,
                      child: VideoPlayer(controller!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Row(
                            children: [
                              AppBorderWidget(
                                imageUrl: widget.image,
                                size: 40,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                widget.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "#trending",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            ContainerDetail(
                              content: widget.name,
                              isScroll: true,
                              containerwidth: 120,
                              icond: Icons.arrow_upward_outlined,
                            ),
                            ContainerDetail(
                              content: "Send gift",
                              isScroll: false,
                              containerwidth: 80,
                              icond: Icons.card_giftcard_sharp,
                            ),
                            ContainerDetail(
                              content: "1",
                              isScroll: false,
                              containerwidth: 45,
                              icond: Icons.add,
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 13),
                              clipBehavior: Clip.antiAlias,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                    image: AssetImage(widget.image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 47,
                    left: 5,
                    child: AppBorderWidget(
                      imageUrl: widget.image,
                      size: 15,
                      borderWidth: 0,
                    ),
                  ),
                  Positioned(
                    bottom: 47,
                    left: 14,
                    child: AppBorderWidget(
                      imageUrl: widget.image,
                      size: 15,
                      borderWidth: 0,
                    ),
                  ),
                  Positioned(
                    bottom: 47,
                    left: 23,
                    child: AppBorderWidget(
                      imageUrl: widget.image,
                      size: 15,
                      borderWidth: 0,
                    ),
                  ),
                  Positioned(
                    bottom: 44,
                    left: 45,
                    child: Text(
                      "Followed by Mini Cooper and 3 others",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 0,
                    child: Column(
                      children: [
                        ReelIcons(
                          icon: Icons.favorite_border,
                        ),
                        Text(
                          widget.like,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        ReelIcons(
                          icon: Icons.insert_comment_outlined,
                        ),
                        Text(
                          widget.comment,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        ReelIcons(
                          icon: Icons.send,
                        ),
                        Text(
                          widget.share,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        ReelIcons(
                          icon: Icons.more_vert,
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
  }
}

class ReelIcons extends StatelessWidget {
  final IconData icon;

  const ReelIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.white,
            size: 27,
          ),
        ),
      ],
    );
  }
}

class ContainerDetail extends StatelessWidget {
  final String content;
  final bool isScroll;
  final double containerwidth;
  final IconData icond;

  const ContainerDetail(
      {super.key,
      required this.content,
      required this.isScroll,
      required this.containerwidth,
      required this.icond});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      height: 27,
      width: containerwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white30,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3.5),
        child: Row(
          children: [
            Icon(
              icond,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 3,
            ),
            isScroll
                ? Expanded(
                    child: Marquee(
                      text: " ${content}",
                      style: TextStyle(color: Colors.white),
                      pauseAfterRound: const Duration(milliseconds: 1000),
                    ),
                  )
                : Expanded(
                    child: Text(
                      content,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
