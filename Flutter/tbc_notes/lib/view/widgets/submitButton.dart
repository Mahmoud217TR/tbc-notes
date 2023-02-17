import 'package:flutter/material.dart';
import 'package:tbc_notes/view/constant.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function() function;
  const SubmitButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      decoration: BoxDecoration(
          color: primerColor,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(48, 73, 86, 100),
                blurRadius: 20,
                spreadRadius: 10,
                offset: Offset(0, 10))
          ],
          borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        minWidth: 250,
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
