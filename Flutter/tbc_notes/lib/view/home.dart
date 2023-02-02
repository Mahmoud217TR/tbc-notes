import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbc_notes/controller/homeController.dart';
import 'package:tbc_notes/view/constant.dart';

class Home extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.scaffoldkey,
      drawer: Drawer(
        child: Container(color: Colors.amber),
      ),
      body: Stack(children: [
        Center(
          child: SizedBox(
            width: size.width * 0.6,
            height: size.height * 0.4,
            // color: Colors.amber,
            child: Opacity(
              opacity: 0.05,
              child: Image(
                fit: BoxFit.fill,
                image: const AssetImage('images/notepad.png'),
                width: size.width * 0.4,
                height: size.height * 0.4,
              ),
            ),
          ),
        ),
        // Center(
        // child: IconButton(
        //     onPressed: () {
        //       controller.openDrawer();
        //     },
        //     icon: Icon(
        //       Icons.menu,
        //       size: 30,
        //     )),
        // ),
        Column(
          children: [
            SizedBox(
              height: size.width * 0.1,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 204, 231, 229),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Expanded(
                  child: TextFormField(
                    // controller: mycontroller,
                    // onChanged: onChanged,mayaa
                    cursorColor: Color.fromARGB(255, 20, 16, 16),
                    decoration: InputDecoration(
                      // icon: Icon(
                      // icon,
                      // color: kPrimaryColor,
                      // ),
                      icon: IconButton(
                          onPressed: () {
                            controller.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                          )),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 11,
                child: Container(
                  color: Colors.blue,
                )),
          ],
        )
      ]),
    );
  }
}
