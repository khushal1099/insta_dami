import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SizeUtils{

  SizeUtils._();
  static double height=0;
  static double width=0;
  static double top=0;

  static config(){
    height=MediaQuery.of(Get.context!).size.height;
    width=MediaQuery.of(Get.context!).size.width;
    top = MediaQuery.of(Get.context!).padding.top;
  }
}