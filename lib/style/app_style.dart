import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color mainColor = Color(0xff1d6d86);
  static Color mainColor2 = Color(0xff4ebeef);
  static Color accentColor = Color(0xff4eefa6);
  static Color accentColor2 = Color(0xff04ca7f);
  static Color textcolor = Color(0xff866a1d);
  static Color textcolor2 = Color(0xffffc306);
  static Color bgColor = Color(0xFFe2e2ff);

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
    Colors.brown.shade200,
    Colors.cyan.shade200,
    Colors.indigo.shade200,
    Colors.lime.shade400,
    Colors.teal.shade400,
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
        Colors.brown.shade200,
        Colors.cyan.shade200,
        Colors.indigo.shade200,
        Colors.lime.shade400,
        Colors.teal.shade400,
        Colors.deepOrange.shade200,
        Colors.grey.shade200
      ];
    }

    // Pick a random index
    final int index = Random().nextInt(cardsColor.length);

    // Remove and return the color at the selected index
    return cardsColor.removeAt(index);
  }

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
}
