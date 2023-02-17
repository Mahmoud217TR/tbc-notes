import 'package:flutter/material.dart';
import 'package:tbc_notes/controller/homeController.dart';
import 'package:tbc_notes/view/constant.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    Key? key,
    required this.controller,
    required this.size,
  }) : super(key: key);

  final HomeController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: fifthColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        //<-- SEE HERE
        side: const BorderSide(
          width: 1.3,
          color: Color.fromARGB(255, 208, 208, 208),
        ),
      ),
      elevation: 0.5,
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
                  Icons.menu_rounded,
                  size: size.width * 0.08,
                  color: Color.fromARGB(255, 131, 130, 130),
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
                    color: Color.fromARGB(255, 131, 130, 130),
                    fontSize: size.width * 0.045,
                    letterSpacing: 0.4,
                    fontWeight: FontWeight.w500),
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
    );
  }
}
