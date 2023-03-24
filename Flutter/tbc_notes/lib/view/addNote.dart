import 'package:flutter/material.dart';
import 'package:tbc_notes/view/constant.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primerColor,
        leadingWidth: 80,
        leading: IconButton(
          iconSize: size.width * 0.07,
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        toolbarHeight: size.height * 0.1,
        actions: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.04),
            child: IconButton(
              iconSize: size.width * 0.07,
              icon: Icon(Icons.done),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(
                      // height: 1.5,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    filled: true,
                    isCollapsed: false,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 30),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: TextFormField(
                  minLines: null,
                  maxLines: null,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                      // height: 1.5,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    hintText: 'Note',
                    hintStyle: TextStyle(
                        color: Colors.grey, fontSize: size.width * 0.05),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
// CustomScrollView(
       