import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  // int selectedIndex = 0;

  void openDrawer() {
    scaffoldkey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldkey.currentState!.openEndDrawer();
  }

  RxInt currentIndex = 0.obs;

  void changePage(int? index) {
    currentIndex(index);
    print(currentIndex);
  }

  
}
