import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbc_notes/view/login.dart';

import 'widgets/submitButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Text(
                  'TBC',
                  style: TextStyle(
                      fontFamily: 'KaushanScript',
                      color: Color(0xff333C4A),
                      fontSize: 70,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'notes',
                  style: TextStyle(
                      fontFamily: 'KaushanScript',
                      color: Color(0xff333C4A),
                      fontSize: 26,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SubmitButton(
                text: 'Get Started',
                function: () {
                  Get.to(()=>  Login());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

