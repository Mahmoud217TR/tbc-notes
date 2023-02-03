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
      resizeToAvoidBottomInset: false,
      key: controller.scaffoldkey,
      drawer: Drawer(
        child: Container(color: Colors.amber),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primerColor,
        foregroundColor: fourthColor,
        onPressed: () {},
        child: Icon(Icons.add),
        
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
        Column(
          children: [
            SizedBox(
              height: size.width * 0.1,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: fourthColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    //<-- SEE HERE
                    side: const BorderSide(
                      color: Color.fromARGB(255, 219, 219, 219),
                    ),
                  ),
                  elevation: 0.8,
                  shadowColor: secondColor,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              controller.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu_outlined,
                              size: size.width * 0.08,
                              color: primerColor,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          // controller: mycontroller,
                          // onChanged: onChanged,mayaa
                          cursorColor: const Color.fromARGB(255, 20, 16, 16),
                          decoration: InputDecoration(
                            // icon: Icon(
                            // icon,
                            // color: kPrimaryColor,
                            // ),

                            hintText: 'Search your notes',
                            hintStyle: TextStyle(
                                color: primerColor,
                                fontSize: size.width * 0.045),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: secondColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 11,
                child: Container(
                    // color: primerColor,
                    )),
          ],
        )
      ]),
    );
  }
}
