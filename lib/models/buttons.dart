import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.ans, this.onTap, {super.key});
  final String ans;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(225, 33, 1, 95),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(ans),
      
    );
  }
}
