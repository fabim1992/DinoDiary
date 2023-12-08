import 'package:dino_diary/common/http_helper.dart';
import 'package:dino_diary/pages/auth_page.dart';
import 'package:flutter/material.dart';
//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // import .env
  await dotenv.load(fileName: ".env");
  // Initialize HTTP handler
  initDio();

  //firebase comandos
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
        dividerColor: Colors.black38,
      ),
      home: const AuthPage(),
      // home: UserProfilePage(),
    );
  }
}
