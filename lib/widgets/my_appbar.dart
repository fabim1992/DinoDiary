import 'package:dino_diary/style/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dino_diary/style/app_style.dart';

ValueNotifier<bool> theme = ValueNotifier<bool>(true);


AppBar buildAppBar(BuildContext context, String pageTitle) {
  //ValueNotifier<bool> theme = ValueNotifier<bool>(true);
  return AppBar(
    leading: BackButton(),
    backgroundColor: AppStyle.mainColor,
    elevation: 0,
    title: Text(pageTitle),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(CupertinoIcons.moon_stars),
        onPressed: () {
          if (theme.value == true) {
            print(theme.value);

            AppStyle.mainColor = AppStyle.darkMode[0];
            AppStyle.mainColor2 = AppStyle.darkMode[1];
            AppStyle.accentColor = AppStyle.darkMode[2];
            AppStyle.accentColor2 = AppStyle.darkMode[3];
            AppStyle.textcolor = AppStyle.darkMode[4];
            AppStyle.textcolor2 = AppStyle.darkMode[5];
            //AppStyle.bgColor = AppStyle.darkMode[6];

            theme.value = !theme.value;
          } else if (theme.value == false) {
            print(theme.value);

            AppStyle.mainColor = AppStyle.lightMode[0];
            AppStyle.mainColor2 = AppStyle.lightMode[1];
            AppStyle.accentColor = AppStyle.lightMode[2];
            AppStyle.accentColor2 = AppStyle.lightMode[3];
            AppStyle.textcolor = AppStyle.lightMode[4];
            AppStyle.textcolor2 = AppStyle.lightMode[5];
            //AppStyle.bgColor = AppStyle.lightMode[6];

            theme.value = !theme.value;
          }
        },
      )
    ],
  );
}
