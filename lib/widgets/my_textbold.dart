import 'package:flutter/material.dart';

class MyTextBold extends StatelessWidget {
  final myText;
  final isBold;
  const MyTextBold({
    super.key,
    required this.myText,
    required this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    if (isBold) {
      return Text(
        myText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else {
      return Text(
        myText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    }
  }
}
