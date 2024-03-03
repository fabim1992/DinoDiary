import 'package:dino_diary/services/auth_service.dart';
import 'package:dino_diary/style/app_style.dart';
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
          backgroundColor: Colors.deepPurple,
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
      backgroundColor: AppStyle.mainColor,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 50),

              //logo
              Image.asset(
                'lib/assets/images/dinosaur-book.png',
                width: 100,
                height: 100,
              ),

              const SizedBox(height: 50),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Bem-vindo a DinoDiary',
                  style: TextStyle(
                    color: AppStyle.accentColor2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              const SizedBox(height: 25),

              //username
              MyTextField(
                controller: usernameController,
                hintText: 'Usuario',
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
                    iscolorwhite: true,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // sign in
              MyButton(
                text: 'Login',
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextBold(
                    isBold: false,
                    myText: 'Ou continue aqui',
                    iscolorwhite: true,
                  ),
                ],
              ),

              const SizedBox(height: 50),
              //todas as opcoes de login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google login
                  LoginWith(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/assets/images/google-logo.png'),

                  const SizedBox(width: 25),

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
                    iscolorwhite: true,
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      '  Registre-se aqui',
                      style: TextStyle(
                        color: AppStyle.textcolor2,
                        //color: Color(0xff2822cd),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
