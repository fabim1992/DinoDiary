import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:flutter/material.dart';

Widget cardDiary(Function()? onTap, QueryDocumentSnapshot doc) {
  return Container(
    padding: EdgeInsets.all(0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppStyle.cardsColor[doc['color_id']],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc["note_title"],
              style: AppStyle.mainTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              doc["note_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ],
        ),
      ),
    ),
  );
}
