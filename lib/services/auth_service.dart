import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    // comeca a interacao para login google
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obter detalhes da autenticacao por request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // criar um novo credencial para o usuario
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // agora vamos ao login
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
