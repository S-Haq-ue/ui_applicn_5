import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Auth Success";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Auth Success";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future<String?> logOut() async {
    try {
      await _auth.signOut();
      return "Logout Success";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  Future<User?> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuthdata = await googleUser?.authentication;
    final AuthCredential userCred =
        GoogleAuthProvider.credential(idToken: googleAuthdata?.idToken, accessToken: googleAuthdata?.accessToken);
        UserCredential userCredential= await _auth.signInWithCredential(userCred); 
    return userCredential.user;
  }
}
