import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Pagina Profile",
        style: TextStyle(fontSize: 50),
      )),
      bottomNavigationBar: MyNavbar(),
    );
  }
}
