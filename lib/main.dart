import 'package:dino_diary/pages/auth_page.dart';
import 'package:dino_diary/services/mock_user.dart';
import 'package:flutter/material.dart';
//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //firebase comandos
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.blue.shade300,
      //   dividerColor: Colors.black38,
      // ),
      home: AuthPage(),
    );
  }
}
