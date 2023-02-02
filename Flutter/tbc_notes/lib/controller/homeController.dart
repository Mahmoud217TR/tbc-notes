import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  void openDrawer() {
      scaffoldkey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldkey.currentState!.openEndDrawer();
   }
}
