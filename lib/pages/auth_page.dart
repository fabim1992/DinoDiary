import 'package:dino_diary/pages/home_page.dart';
import 'package:dino_diary/pages/login_or_register.dart';
import 'package:dino_diary/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // usario logado
          if (snapshot.hasData) {
            return HomePage();
          }
          // usuario nao logado
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
