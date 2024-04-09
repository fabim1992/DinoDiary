import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  int colorId = Random().nextInt(AppStyle.cardsColor.length);
  DateTime now = DateTime.now();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('yyyy-MM-dd HH:mm').format(now);
    String dayOfWeek = DateFormat('EEEE').format(now);

    return Scaffold(
      bottomNavigationBar: MyNavbar(),
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: buildAppBar(context, "Adicionar novo registro"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Titulo do registro',
              ),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayOfWeek,
                  style: AppStyle.dateTitle,
                ),
                Text(
                  date,
                  style: AppStyle.dateTitle,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Escreva o registro',
              ),
              style: AppStyle.mainContent,
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
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(50.0, 50.0)),
                backgroundColor:
                    MaterialStateProperty.all(AppStyle.accentColor),
              ),
              child: const Icon(Icons.edit),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(50.0, 50.0)),
                backgroundColor:
                    MaterialStateProperty.all(AppStyle.accentColor),
              ),
              child: const Icon(Icons.palette),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(50.0, 50.0)),
                backgroundColor:
                    MaterialStateProperty.all(AppStyle.accentColor),
              ),
              child: const Icon(Icons.text_format),
            ),
            const SizedBox(width: 16.0),
            FloatingActionButton(
              backgroundColor: AppStyle.accentColor,
              onPressed: () async {
                FirebaseFirestore.instance.collection("Notes").add({
                  "note_title": _titleController.text,
                  "creation_date": date,
                  "note_content": _mainController.text,
                  "color_id": colorId
                }).then((value) {
                  print(value.id);
                  Navigator.maybePop(context);
                }).catchError(
                  (error) =>
                      print("Falha ao adicionar registro por causa de $error"),
                );
              },
              child: const Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
