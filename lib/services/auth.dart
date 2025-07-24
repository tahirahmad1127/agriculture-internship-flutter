import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  ///sign Up
  Future<User?> registerUser ({required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance.
    createUserWithEmailAndPassword(email: email, password: password);
    userCredential.user!.sendEmailVerification();
    return userCredential.user;
  }
  /// Login
  Future<User?> loginUser ({required String email, required String password})async{
    UserCredential userCredential = await FirebaseAuth.instance.
    signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
  /// forgot Password
  Future resetPassword (String email) async {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}