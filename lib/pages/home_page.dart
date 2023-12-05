import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_diary/pages/note_editor.dart';
import 'package:dino_diary/pages/note_reader.dart';
import 'package:dino_diary/services/Singleton.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/card_diary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  var userS = Singleton();
  var date = DateTime.now;

  // sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
          elevation: 0.0,
          title: const Text("Diario"),
          centerTitle: true,
          backgroundColor: AppStyle.mainColor,
          actions: [
            IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seus ultimos registros",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => cardDiary(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NoteReaderPage(note),
                                    ));
                              }, note))
                          .toList(),
                    );
                  }
                  return Text(
                    "Sem registros",
                    style: GoogleFonts.nunito(color: Colors.white),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteEditorPage()));
        },
        label: Text("Adicionar Registro"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
