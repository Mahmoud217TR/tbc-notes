import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tbc_notes/view/home.dart';
import 'package:tbc_notes/view/login.dart';
import 'package:tbc_notes/view/signup.dart';
import 'package:tbc_notes/view/welcomePage.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int currentTap = 0;
  final List<Widget> screens = [
    Home(),
    Login(),
    SignUp(),
    WelcomePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 100,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    color: Colors.amber,
                    child: MaterialButton(onPressed: () {})),
              ),
              Expanded(
                child: Container(
                    color: Colors.pink,
                    child: MaterialButton(onPressed: () {})),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
