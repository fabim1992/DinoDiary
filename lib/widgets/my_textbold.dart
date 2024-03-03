import 'package:flutter/material.dart';

class MyTextBold extends StatelessWidget {
  final myText;
  final isBold;
  final iscolorwhite;
  const MyTextBold({
    super.key,
    required this.myText,
    required this.isBold,
    required this.iscolorwhite,
  });

  @override
  Widget build(BuildContext context) {
    if (isBold && iscolorwhite) {
      return Text(
        myText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      );
    } else if (isBold == false && iscolorwhite) {
      return Text(
        myText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      );
    } else if (isBold && iscolorwhite == false) {
      return Text(
        myText,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      );
    } else {
      return Text(
        myText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      );
    }
  }
}
