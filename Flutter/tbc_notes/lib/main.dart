import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbc_notes/view/home.dart';
import 'package:tbc_notes/view/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(primarySwatch: MaterialColor(primary, swatch)),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
