import 'package:dino_diary/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String pageTitle) {
  return AppBar(
    leading: BackButton(),
    backgroundColor: AppStyle.mainColor,
    elevation: 0,
    title: Text(pageTitle),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(CupertinoIcons.moon_stars),
        onPressed: () {},
      )
    ],
  );
}
