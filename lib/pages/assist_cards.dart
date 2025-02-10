import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/card_user.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_textbold.dart';
import 'package:flutter/material.dart';
import 'package:dino_diary/widgets/my_navbar.dart';

class AssistCard extends StatelessWidget {
  const AssistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavbar(),
      backgroundColor: AppStyle.mainColor,
      appBar: buildAppBar(context, "Amigos"),
      body: ListView(
        children: [
          Column(
            children: [
              CardUser(
                userName: 'Fabio',
              ),
              CardUser(
                userName: 'Lucas',
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
