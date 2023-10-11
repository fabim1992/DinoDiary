import 'package:flutter/material.dart';

class MyTextClick extends StatelessWidget {
  final txt;
  final Function()? onTap;
  const MyTextClick({super.key, required this.txt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          txt,
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: onTap,
        )
      ],
    );
  }
}
