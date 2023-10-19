import 'package:dino_diary/services/auth_service.dart';
import 'package:dino_diary/widgets/login_with.dart';
import 'package:dino_diary/widgets/my_button.dart';
import 'package:dino_diary/widgets/my_textbold.dart';
import 'package:dino_diary/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // variaveis de controle
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // Funcao SignIn
  void signUserIn() async {
    // loading
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // autenticando login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      //parar loading
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //parar loading
      Navigator.pop(context);
      // mostrar msg de erro
      showErrorMessage(e.code);
    }
  }

  // funcao alerta
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF9CE37D),
          title: Center(
              child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8FC0A9),
      
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 50),

              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              //Navbar

              const SizedBox(height: 50),

              //text
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Bem-vindo(a) ao DinoDiary!',
                  style: TextStyle(
                    color: Color(0xFFFAF3DD),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              const SizedBox(height: 25),

              //username
              MyTextField(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 20),
              //password
              MyTextField(
                controller: passwordController,
                hintText: 'Senha',
                obscureText: true,
              ),

              const SizedBox(height: 20),
              //forgot password?
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextBold(
                    isBold: false,
                    myText: 'Esqueceu a senha?',
                    
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // sign in
              MyButton(
                text: 'Login',
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextBold(
                    isBold: false,
                    myText: 'Ou continue aqui',
                  ),
                ],
              ),

              const SizedBox(height: 20),
              //todas as opcoes de login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google login
                  LoginWith(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/assets/images/google-logo.png'),

                  SizedBox(width: 25),

                  //apple login
                  LoginWith(
                      onTap: () => {},
                      imagePath: 'lib/assets/images/apple-logo.png'),
                ],
              ),
              const SizedBox(height: 30),
              // registre-se
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyTextBold(
                    isBold: false,
                    myText: 'Sem Cadastro?',
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      '  Registre-se aqui',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        //color: Color(0xff2822cd),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              //const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
