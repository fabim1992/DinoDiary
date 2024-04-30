import 'package:dino_diary/pages/home_page.dart';
import 'package:dino_diary/widgets/card_diary.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_diary/pages/note_editor.dart';
import 'package:dino_diary/pages/note_reader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dino_diary/style/app_style.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalendarPage> {
  DateTime now = DateTime.now();
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavbar(),
      appBar: buildAppBar(context, 'Calendário'),
      backgroundColor: AppStyle.mainColor2,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //Text("Dia selecionado = ${today.toString().split(" ")[0]}"),
            Text("Seus Registros de Cada Dia", style:TextStyle(color: AppStyle.textcolor, fontSize: 16, fontWeight: FontWeight.bold)),
            TableCalendar(
              locale: "en_US",
              rowHeight: 39,
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(color: AppStyle.textcolor, fontSize: 17, fontWeight: FontWeight.bold),
                rightChevronIcon: Icon(Icons.chevron_right_rounded, color: AppStyle.textcolor),
                leftChevronIcon: Icon(Icons.chevron_left_rounded, color: AppStyle.textcolor),
                formatButtonVisible: false,
                titleCentered: true,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: AppStyle.textcolor, fontSize: 16), weekendStyle: TextStyle(color: AppStyle.textcolor)),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 5, 13),
              lastDay: DateTime.utc(2030, 5, 13),
              onDaySelected: _onDaySelected,
              calendarStyle: CalendarStyle(
                  weekendTextStyle: TextStyle(color: AppStyle.textcolor, fontSize: 16),
                  
                  defaultTextStyle:
                      TextStyle(color: AppStyle.textcolor, fontSize: 17),
                  outsideTextStyle:
                      TextStyle(color: AppStyle.textcolor2, fontSize: 15),
                  todayDecoration: BoxDecoration(
                      color: AppStyle.accentColor, shape: BoxShape.circle),
                  todayTextStyle:
                      TextStyle(color: AppStyle.textcolor, fontSize: 17),
                  selectedDecoration: BoxDecoration(
                      color: AppStyle.accentColor, shape: BoxShape.circle)),
            ),
            
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Notes").where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).where("creation_date", isEqualTo: "${today.toString().split(" ")[0]}")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasData) {
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
                    "Os registros de cada dia aparecem aqui",
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        label: const Text("Histórico Completo"),
        icon: const Icon(Icons.history),
        backgroundColor: AppStyle.accentColor,
      ),
    );
  }
}
