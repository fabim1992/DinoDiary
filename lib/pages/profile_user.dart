import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:flutter/material.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavbar(),
    );
  }
}
