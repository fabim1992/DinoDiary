import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/my_textbold.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final String userName;

  CardUser({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = AppStyle.pickColor();

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        padding:
            EdgeInsets.only(left: 20.0, right: 40.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Container em torno da imagem do paciente
                Container(
                  width: 60.0, // Defina a largura desejada
                  height: 60.0, // Defina a altura desejada
                  child: Image.asset('lib/assets/images/dinosaur-book.png'),
                ),
                // Nome do paciente
                MyTextBold(myText: userName, isBold: true, iscolorwhite: false),
              ],
            ),
            InkWell(
              onTap: () {
                // Handle the onTap action for the email icon
                print('Email icon clicked');
              },
              child: Icon(Icons.email),
            ),
            InkWell(
              onTap: () {
                // Handle the onTap action for the account box icon
                print('Account Box icon clicked');
              },
              child: Icon(Icons.account_box),
            ),
            InkWell(
              onTap: () {
                // Handle the onTap action for the auto stories icon
                print('Auto Stories icon clicked');
              },
              child: Icon(Icons.auto_stories),
            ),
            InkWell(
              onTap: () {
                // Handle the onTap action for the chat icon
                print('Chat icon clicked');
              },
              child: Icon(Icons.chat),
            ),
          ],
        ),
      ),
    );
  }
}
