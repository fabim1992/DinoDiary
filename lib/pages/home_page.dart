import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_diary/pages/note_editor.dart';
import 'package:dino_diary/pages/note_reader.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/card_diary.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //final user = FirebaseAuth.instance.currentUser!;
  var date = DateTime.now;

  // sign user out
  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: buildAppBar(context, "Histórico Completo"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Notes").where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasData) {
                    print(snapshot.data!.docs.toList().length);
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
        label: const Text("Adicionar Registro"),
        icon: const Icon(Icons.add),
        backgroundColor: AppStyle.accentColor,
      ),
    );
  }
}
