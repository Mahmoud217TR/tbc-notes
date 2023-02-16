import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbc_notes/controller/iconButtonController.dart';
import 'package:tbc_notes/view/constant.dart';
import 'package:tbc_notes/view/home.dart';
import 'package:tbc_notes/view/login.dart';
import 'package:tbc_notes/view/widgets/submitButton.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  IconButtonController controller = Get.put(IconButtonController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TBC',
                  style: TextStyle(
                      fontFamily: 'KaushanScript',
                      color: primerColor,
                      fontSize: 70,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'notes',
                  style: TextStyle(
                      fontFamily: 'KaushanScript',
                      color: primerColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              // color: Colors.pink,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.04,
                    horizontal: size.height * 0.03),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: size.width * 0.075,
                              color: primerColor,
                            ),
                            // hintText: 'Type Your Email',
                            // hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                color: primerColorWithOpacity,
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              size: size.width * 0.08,
                              color: primerColor,
                            ),
                            // hintText: 'Type Your Email',
                            // hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'USERNAME',
                            labelStyle: TextStyle(
                                color: primerColorWithOpacity,
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Obx(
                        () => Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              obscureText: controller.obsecureText.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline_sharp,
                                  size: size.width * 0.08,
                                  color: primerColor,
                                ),
                                // hintText: 'Type Your Password',
                                // hintStyle: TextStyle(color: Colors.grey),
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    color: primerColorWithOpacity,
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: primerColorWithOpacity,
                                  ),
                                  onPressed: () {
                                    controller.click();
                                  },
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * 0.07),
                child: SubmitButton(
                  function: () {
                    Get.to(() => Home());
                  },
                  text: 'Sign Up',
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 183, 182, 182)),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(() => Login());
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: primerColor,
                            fontSize: size.width * 0.05,
                            letterSpacing: 1),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
