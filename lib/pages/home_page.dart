import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import './calendar_page.dart';
import 'package:dino_diary/services/auth_service.dart';
import 'package:dino_diary/widgets/login_with.dart';
import 'package:dino_diary/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User user = FirebaseAuth.instance.currentUser!;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(
      child: Icon(
        Icons.account_circle,
        size: 150,
      ),
    ),
    CalendarPage(),
    Center(
      child: Icon(
        Icons.add_circle_outline,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.pets,
        size: 150,
      ),
    ),
    ConfigPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8FC0A9),
      appBar: AppBar(backgroundColor: Color(0xFF40798C), actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
      ]),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Color(0xFFFAF3DD),
        elevation: 0,
        selectedFontSize: 20,
        unselectedIconTheme: IconThemeData(color: Color(0xFFC8D5B9)),
        selectedIconTheme: IconThemeData(color: Color(0xFF8FC0A9), size: 40),
        selectedItemColor: const Color(0xFF8FC0A9),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        iconSize: 40,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Conta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Diário',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Dino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

/////////////////////////ABAS
///mover cada aba para um arquivo separado depois

//CALENDARIO

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'TESTANDO',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}

//CONFIG

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigState();
}

class _ConfigState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8FC0A9),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 25),

              MyButton(
                text: 'Alterar Email',
                onTap: () {},
              ),

              const SizedBox(height: 25),

              MyButton(
                text: 'Alterar Senha',
                onTap: () {},
              ),

              const SizedBox(height: 25),

              //mudar cores do app
              MyButton(
                text: 'Alterar Cores',
                onTap: () {
                  
                },
              ),

              const SizedBox(height: 80),

              MyButton(
                text: '! DELETAR CONTA !',
                onTap: () async {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color(0xFF9CE37D),
                        title: const Text('Confirmar',style: const TextStyle(color: Colors.white),),
                        content: const SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text('! Esta ação é irreversível !',style: const TextStyle(color: Colors.white),),
                              Text('Quer mesmo deletar sua conta?',style: const TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Confirm',style: const TextStyle(color: Colors.white),),
                            onPressed: () async {
                              await user.delete();
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Cancel', style: const TextStyle(color: Colors.white),),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
