import 'package:dino_diary/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:dino_diary/widgets/login_with.dart';
import 'package:dino_diary/widgets/my_button.dart';
import 'package:dino_diary/widgets/my_textbold.dart';
import 'package:dino_diary/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // variaveis de controle
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  // Funcao SignUp
  void signUserUp() async {
    // loading
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // criando conta usuario
    try {
      // testar senhas
      if (passwordController.text == confirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
      } else {
        // mostrar mensagem de erro caso senhas diferentes
        showErrorMessage('Senhas diferentes');
      }
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
              const SizedBox(height: 25),

              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 25),

              //text
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Registre-se no DinoDiary',
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

              //password
              MyTextField(
                controller: confirmController,
                hintText: 'Confirmar Senha',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign in
              MyButton(
                text: 'Cadastre-se',
                onTap: signUserUp,
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
                    myText: 'Ja tem uma conta?',
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      '  Entre Aqui',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        //color: Color(0xff2822cd),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
