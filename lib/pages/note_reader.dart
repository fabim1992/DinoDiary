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
  
  //final TextEditingController _titleController = TextEditingController();
  //final TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc['color_id'];
    String title =  widget.doc["note_title"];
    String text =  widget.doc["note_content"];
    final TextEditingController _titleController = TextEditingController(text:title);
    final TextEditingController _mainController = TextEditingController(text:text);
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: widget.doc["note_title"]),
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
                constraints: const BoxConstraints.expand(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    
                    controller: _mainController,
                    
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.doc["note_content"],
                    ),
                    style: AppStyle.mainContent,
                    //initialValue: widget.doc["note_content"]!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore.instance
                      .collection("Notes")
                      .doc(widget.doc.id.toString())
                      .update({
                    "note_title": _titleController.text,
                    "note_content": _mainController.text,
                    "color_id": colorId
                  }).then((value) {
                    Navigator.pop(context);
                  }).catchError((error) => print(
                          "Falha ao atualizar registro por causa de $error"));
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(50.0, 50.0)),
                  backgroundColor:
                      MaterialStateProperty.all(AppStyle.accentColor),
                ),
                child: const Icon(Icons.save),
              ),
              ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore.instance
                      .collection("Notes")
                      .doc(widget.doc.id.toString())
                      .delete()
                      .then((value) {
                    Navigator.pop(context);
                  }).catchError((error) => print(
                          "Falha ao atualizar registro por causa de $error"));
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(50.0, 50.0)),
                  backgroundColor:
                      MaterialStateProperty.all(AppStyle.accentColor),
                ),
                child: const Icon(Icons.delete),
              ),
            ],
          )),
    );
  }
}