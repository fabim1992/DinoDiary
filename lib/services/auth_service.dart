import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<UserCredential?> signInWithGoogle() async {
    // Start the interaction for Google login
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Check if the user cancels the sign-in process
    if (googleUser == null) {
      return null;
    }

    // Get authentication details from the sign-in request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Perform the login
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
