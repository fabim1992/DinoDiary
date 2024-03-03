import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color mainColor = Color(0xff1d6d86);
  static Color mainColor2 = Color(0xff70A9A1);
  static Color accentColor = Color(0xff9EC1A3);
  static Color accentColor2 = Color(0xffCFE0C3);
  static Color textcolor = Color(0xff1F363D);
  static Color textcolor2 = Color.fromARGB(255, 255, 249, 193);
  static Color bgColor = Color.fromARGB(255, 255, 249, 193);

  static List<Color> cardsColor = [
    Colors.purple.shade200,
    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.orange.shade200,
    Colors.yellow.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.blueGrey.shade200,
    Colors.amber.shade300,
    Colors.cyan.shade200,
    Colors.indigo.shade200,
    Colors.lime.shade400,
    Colors.deepOrange.shade200,
    Colors.grey.shade200
  ];

  static Color pickColor() {
    if (cardsColor.isEmpty) {
      // If the list is empty, reset it
      cardsColor = [
        Colors.purple.shade200,
        Colors.red.shade200,
        Colors.pink.shade200,
        Colors.orange.shade200,
        Colors.yellow.shade400,
        Colors.green.shade200,
        Colors.blue.shade200,
        Colors.blueGrey.shade200,
        Colors.amber.shade300,
        Colors.cyan.shade200,
        Colors.indigo.shade200,
        Colors.lime.shade200,
        Colors.deepOrange.shade200,
        Colors.grey.shade200
      ];
    }

    // Pick a random index
    final int index = Random().nextInt(cardsColor.length);

    // Remove and return the color at the selected index
    return cardsColor[(index)];
  }

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
}
