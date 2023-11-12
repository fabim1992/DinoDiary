import 'package:dino_diary/pages/assist_cards.dart';
import 'package:dino_diary/pages/calendar_page.dart';
import 'package:dino_diary/pages/profile_user.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

final PageController _pageController = PageController();
int _selectedIndex = 0; // Index of the active tab

class MyNavbar extends StatefulWidget {
  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0; // Index of the active tab

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyle.mainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: GNav(
          backgroundColor: AppStyle.mainColor,
          color: Colors.white,
          activeColor: Colors.black87,
          tabBackgroundColor: AppStyle.accentColor2,
          gap: 5,
          selectedIndex: _selectedIndex,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              icon: Icons.account_circle,
              text: 'Conta',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUserPage()),
                );
              },
            ),
            GButton(
              icon: Icons.auto_stories,
              text: 'Calendário',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
            ),
            GButton(
              icon: Icons.add_circle,
              text: 'Novo Registro',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssistCard()),
                );
              },
            ),
            GButton(
              icon: Icons.pets,
              text: 'Dino',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
            ),
            GButton(
              icon: Icons.settings,
              text: 'Configurações',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUserPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
