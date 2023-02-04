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
      resizeToAvoidBottomInset: false,
      key: controller.scaffoldkey,
      drawer: Drawer(
        child: Container(color: Colors.amber),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: (() {}),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 100,
        // child: Container(
        //   height: 60,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            items: [
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.home)
              ),
              BottomNavigationBarItem(
                                label: 'home',

                icon: Icon(Icons.home)
              ),
              
            ],
          ),
      //   ),
      // ),
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
// class Home extends GetView<HomeController> {
//   //  int currentIndex = 0;

//   // void changePage(int? index) {
//   //   setState(() {
//   //     currentIndex = index!;
//   //   });
//   // }
//   @override

//   HomeController controller = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       key: controller.scaffoldkey,
//       drawer: Drawer(
//         child: Container(color: Colors.amber),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   backgroundColor: primerColor,
//       //   foregroundColor: fourthColor,
//       //   onPressed: () {},
//       //   child: Icon(Icons.add),

//       // ),
//       // bottomNavigationBar: FloatingActionButton(
//       //   onPressed: () {},
//       //   child: Icon(Icons.add),
//       //   backgroundColor: Colors.red,
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       bottomNavigationBar: BubbleBottomBar(
//         hasNotch: true,
//         fabLocation: BubbleBottomBarFabLocation.end,
//         opacity: .2,
//         currentIndex: controller.currentIndex,
//         onTap: controller.changePage,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(16),
//         ), //border radius doesn't work when the notch is enabled.
//         elevation: 8,
//         tilesPadding: EdgeInsets.symmetric(
//           vertical: 8.0,
//         ),
//         items: <BubbleBottomBarItem>[
//           BubbleBottomBarItem(
//             showBadge: true,
//             badge: Text("5"),
//             badgeColor: Colors.deepPurpleAccent,
//             backgroundColor: Colors.red,
//             icon: Icon(
//               Icons.dashboard,
//               color: Colors.black,
//             ),
//             activeIcon: Icon(
//               Icons.dashboard,
//               color: Colors.red,
//             ),
//             title: Text("Home"),
//           ),
//           BubbleBottomBarItem(
//               backgroundColor: Colors.deepPurple,
//               icon: Icon(
//                 Icons.access_time,
//                 color: Colors.black,
//               ),
//               activeIcon: Icon(
//                 Icons.access_time,
//                 color: Colors.deepPurple,
//               ),
//               title: Text("Logs")),
//           BubbleBottomBarItem(
//               backgroundColor: Colors.indigo,
//               icon: Icon(
//                 Icons.folder_open,
//                 color: Colors.black,
//               ),
//               activeIcon: Icon(
//                 Icons.folder_open,
//                 color: Colors.indigo,
//               ),
//               title: Text("Folders")),
//           BubbleBottomBarItem(
//               backgroundColor: Colors.green,
//               icon: Icon(
//                 Icons.menu,
//                 color: Colors.black,
//               ),
//               activeIcon: Icon(
//                 Icons.menu,
//                 color: Colors.green,
//               ),
//               title: Text("Menu"))
//         ],
//       ),
//       body: Stack(children: [
//         Center(
//           child: SizedBox(
//             width: size.width * 0.6,
//             height: size.height * 0.4,
//             // color: Colors.amber,
//             child: Opacity(
//               opacity: 0.05,
//               child: Image(
//                 fit: BoxFit.fill,
//                 image: const AssetImage('images/notepad.png'),
//                 width: size.width * 0.4,
//                 height: size.height * 0.4,
//               ),
//             ),
//           ),
//         ),
//         Column(
//           children: [
//             SizedBox(
//               height: size.width * 0.1,
//             ),
//             Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Card(
//                   color: fourthColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     //<-- SEE HERE
//                     side: const BorderSide(
//                       color: Color.fromARGB(255, 219, 219, 219),
//                     ),
//                   ),
//                   elevation: 0.8,
//                   shadowColor: secondColor,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: IconButton(
//                             onPressed: () {
//                               controller.openDrawer();
//                             },
//                             icon: Icon(
//                               Icons.menu_outlined,
//                               size: size.width * 0.08,
//                               color: primerColor,
//                             )),
//                       ),
//                       Expanded(
//                         flex: 3,
//                         child: TextFormField(
//                           // controller: mycontroller,
//                           // onChanged: onChanged,mayaa
//                           cursorColor: const Color.fromARGB(255, 20, 16, 16),
//                           decoration: InputDecoration(
//                             // icon: Icon(
//                             // icon,
//                             // color: kPrimaryColor,
//                             // ),

//                             hintText: 'Search your notes',
//                             hintStyle: TextStyle(
//                                 color: primerColor,
//                                 fontSize: size.width * 0.045),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                           flex: 1,
//                           child: CircleAvatar(
//                             backgroundColor: secondColor,
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//                 flex: 11,
//                 child: Container(
//                     // color: primerColor,
//                     )),
//           ],
//         )
//       ]),
//     );
//   }
// }
