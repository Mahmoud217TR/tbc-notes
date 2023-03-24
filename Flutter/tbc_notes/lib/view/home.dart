import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbc_notes/controller/homeController.dart';
import 'package:tbc_notes/view/addNote.dart';
import 'package:tbc_notes/view/constant.dart';
import 'package:tbc_notes/view/welcomePage.dart';
import 'package:tbc_notes/view/widgets/searchbar.dart';

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
              selectedItemColor: secondColor,
              selectedLabelStyle:
                  const TextStyle(color: Color.fromARGB(255, 25, 21, 11)),
              selectedFontSize: size.width * 0.05,
              unselectedFontSize: size.width * 0.05,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.edit_calendar_outlined,
                    size: size.width * 0.1,
                  ),
                  icon: Icon(
                    Icons.edit_calendar_outlined,
                    size: size.width * 0.1,
                  ),
                  label: 'Notes',
                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.grid_view_rounded,
                      size: size.width * 0.1,
                    ),
                    icon: Icon(
                      Icons.grid_view_outlined,
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
          decoration: const BoxDecoration(
              // color: Gradient(colors: [Colors.amber,Colors.white]),
              shape: BoxShape.circle),
          child: FittedBox(
            child: FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 10,
              backgroundColor: primerColor,
              // foregroundColor: fourthColor,
              onPressed: () {
                Get.to(() => AddNote());
              },
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
                            secondColor,
                            primerColor,
                            // secondColor,
                          ])),
                  child: Icon(
                    Icons.add,
                    color: fourthColor,
                    size: size.width * 0.09,
                    shadows: const [Shadow(color: Colors.amber)],
                  )),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.width * 0.1,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MySearchBar(controller: controller, size: size),
              ),
            ),
            Expanded(
                flex: 11,
                child: Obx(() => controller.currentIndex.value == 0
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => WelcomePage());
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                //<-- SEE HERE
                                side: const BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 157, 157, 157),
                                ),
                              ),
                              // color: Colors.amber,
                              elevation: 0,
                              child: const Center(child: Text('hi')),
                            ),
                          );
                        },
                      )
                    : Container(
                        color: Colors.black,
                      ))),
          ],
        ));
  }
}
