import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:flutter/material.dart';

class UserConfigPage extends StatelessWidget {
  const UserConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text(
        "Pagina Config",
        style: TextStyle(fontSize: 50),
      )),
      bottomNavigationBar: MyNavbar(),
    );
  }
}
