import 'package:get/get.dart';

import '../utils/ListUtils.dart';

class Searchcontroller extends GetxController {
  RxList<Map<String, String>> searchList = <Map<String, String>>[].obs;

  @override
  void onInit() {
    searchList.value = messageList;
    super.onInit();
  }

  void searchuser(String search) {
    List<Map<String,String>> result = [];
    if (search.isEmpty) {
      result = messageList;
    } else {
      result = messageList
          .where((e) => e["name"]
          .toString()
          .toLowerCase()
          .contains(search.toLowerCase()))
          .toList();
    }
    searchList.value = result;
  }
}
