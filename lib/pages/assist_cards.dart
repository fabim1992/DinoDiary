import 'dart:html';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/Card_user.dart';
import 'package:dino_diary/widgets/my_textbold.dart';
import 'package:flutter/material.dart';

class AssistCard extends StatelessWidget {
  AssistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        title: MyTextBold(
          myText: 'SEUS PACIENTES',
          isBold: true,
          iscolorwhite: true,
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CardUser(
                userName: 'Fabio',
              ),
              CardUser(
                userName: 'LuCas',
              ),
              CardUser(
                userName: 'Lara',
              ),
              CardUser(
                userName: 'Ronaldo',
              ),
              CardUser(
                userName: 'Drogo',
              ),
              CardUser(
                userName: 'Rhaegal',
              ),
              CardUser(
                userName: 'Viserion',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
