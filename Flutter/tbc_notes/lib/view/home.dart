import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbc_notes/controller/homeController.dart';
import 'package:tbc_notes/view/constant.dart';

class Home extends StatelessWidget {
  Home({super.key});
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Colors.amber,
        resizeToAvoidBottomInset: false,
        key: controller.scaffoldkey,
        drawer: Drawer(
          child: Container(color: Colors.amber),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: size.height * 0.1,
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 241, 238, 238),
                  blurRadius: 2,
                  spreadRadius: 5,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Obx(
            () => BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (value) {
                controller.changePage(value);
              },
              selectedItemColor: Color.fromARGB(255, 171, 175, 103),
              // selectedLabelStyle:
              //     TextStyle(color: Color.fromARGB(255, 25, 21, 11)),
              selectedFontSize: size.width * 0.05,
              unselectedFontSize: size.width * 0.05,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.edit_calendar_outlined,
                    size: size.width * 0.1,
                  ),
                  label: 'Notes',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.grid_view_rounded,
                      size: size.width * 0.1,
                    ),
                    label: 'Groups'),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          // color: Colors.amber,
          height: size.width * 0.19,
          // width: 80,
          decoration: BoxDecoration(
              // color: Gradient(colors: [Colors.amber,Colors.white]),
              shape: BoxShape.circle),
          child: FittedBox(
            child: FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 10,
              backgroundColor: primerColor,
              // foregroundColor: fourthColor,
              onPressed: () {},
              child: Container(
                  height: size.width * 0.19,
                  width: size.width * 0.19,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            // fourthColor,
                            fourthColor,
                            primerColorWithOpacity,
                            primerColor,
                            // secondColor,
                          ])),
                  child: Icon(
                    Icons.add,
                    color: fourthColor,
                    size: size.width * 0.09,
                    shadows: [Shadow(color: Colors.amber)],
                  )),
            ),
          ),
        ),
        body: Obx(() => controller.currentIndex.value == 0
            ? Stack(children: [
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
                                  cursorColor:
                                      const Color.fromARGB(255, 20, 16, 16),
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
              ])
            : Container()));
  }
}
