import 'package:get/get.dart';

class ChatController extends GetxController {
  String? name;
  String? image;
  String? pd;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      name = Get.arguments["name"];
      image = Get.arguments["image"];
      pd = Get.arguments["published day"];
    }
  }
}
