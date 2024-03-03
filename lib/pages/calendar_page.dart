import 'package:dino_diary/pages/home_page.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dino_diary/style/app_style.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalendarPage> {
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
      appBar: buildAppBar(context, 'Calendario'),
      backgroundColor: AppStyle.mainColor2,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Dia selecionado = ${today.toString().split(" ")[0]}"),
            TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 5, 13),
              lastDay: DateTime.utc(2030, 5, 13),
              onDaySelected: _onDaySelected,
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: AppStyle.textcolor, fontSize: 17),
                outsideTextStyle: TextStyle(color: AppStyle.textcolor2, fontSize: 17),
                todayDecoration: BoxDecoration(color: AppStyle.accentColor, shape: BoxShape.circle),
                todayTextStyle: TextStyle(color: AppStyle.textcolor, fontSize: 17),
                selectedDecoration: BoxDecoration(color: AppStyle.accentColor, shape: BoxShape.circle)
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        label: const Text("Registros Recentes"),
        icon: const Icon(Icons.history),
        backgroundColor: AppStyle.accentColor,
      ),
    );
  }
}