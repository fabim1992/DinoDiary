import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/my_button.dart';
import 'package:flutter/material.dart';

class NoteReaderPage extends StatefulWidget {
  NoteReaderPage(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderPage> createState() => _NoteReaderPageState();
}

class _NoteReaderPageState extends State<NoteReaderPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
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
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                constraints: BoxConstraints.expand(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.doc["note_content"],
                    style: AppStyle.mainContent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").doc().update({
            "note_title": _titleController.text,
            "note_content": _mainController.text,
            "color_id": color_id
          }).then((value) {
            Navigator.pop(context);
          }).catchError((error) =>
              print("Falha ao adicionar registro por causa de $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
