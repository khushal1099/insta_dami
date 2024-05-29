import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/chat_controller.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  ChatController controller = Get.put(ChatController());

  RxBool isShow = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage(controller.image.toString()),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      controller.name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                     SizedBox(
                      width: 6,
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Active ${controller.pd}h ago",
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.local_phone_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.label_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                MessageItem(
                  message: 'hi',
                  isMyMessage: true,
                ),
                MessageItem(
                  message: 'abc abc abc abc abc ',
                  image: controller.image,
                ),
                MessageItem(
                  message: 'hi',
                  isMyMessage: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: MessageItem(
                    message:
                        'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc',
                    isMyMessage: true,
                  ),
                ),
                MessageItem(
                  message: 'message',
                  image: controller.image,
                ),
                MessageItem(
                  message: 'message',
                  isMyMessage: true,
                ),
                MessageItem(
                  message: 'message',
                  isMyMessage: true,
                ),
                MessageItem(
                  message: 'message',
                  image: controller.image,
                ),
                MessageItem(
                  message: 'message',
                  isMyMessage: true,
                ),
                MessageItem(
                  message: 'message',
                  isMyMessage: true,
                ),
                MessageItem(
                  message: 'message',
                  image: controller.image,
                ),
                MessageItem(
                  message: 'message',
                  isMyMessage: true,
                ),
                MessageItem(
                  message: 'message',
                  isMyMessage: true,
                ),
                MessageItem(
                  message: 'message',
                  image: controller.image,
                ),
                MessageItem(
                  message:
                      'abc dba cbd abc abd cba dbc abd cba dbc abd c abd cba dbc ab a cba dba c a dba cba ',
                  isMyMessage: true,
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 5,
              ),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff262626),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    isShow.value = value.isNotEmpty;
                    print(isShow.value);
                  },
                  decoration: InputDecoration(
                    hintText: "Message...",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 25),
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: isShow.value
                            ? const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              )
                            : const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 30,
                              )),
                    suffixIcon: isShow.value
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Send",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconWidget(icon: Icons.mic),
                              IconWidget(icon: Icons.photo),
                              IconWidget(icon: Icons.message),
                              IconWidget(icon: Icons.add_circle_outline_sharp),
                            ],
                          ),
                  ),
                  onFieldSubmitted: (value) {
                    isShow.value = false;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String message;
  final bool isMyMessage;
  final String? image;

  const MessageItem(
      {super.key, required this.message, this.isMyMessage = false, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMyMessage && image != null)
            CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage(image!),
            ),
          if (isMyMessage) const SizedBox(width: 100),
          if (!isMyMessage) const SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xff262626),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          if (isMyMessage) const SizedBox(width: 5),
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;

  const IconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
