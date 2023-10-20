import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:flutter/material.dart';

class NoteReaderPage extends StatefulWidget {
  NoteReaderPage(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderPage> createState() => _NoteReaderPageState();
}

class _NoteReaderPageState extends State<NoteReaderPage> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
