import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._hl();

  static final AuthHelper authHelper = AuthHelper._hl();

  loginAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          log("Unable to login anonymosly...");
          break;
        default:
          log("Exception: ${e.code}");
      }
      return false;
    }
  }

  registerUser({required String email, required String password}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "Week-password":
          log(e.code);
          break;
        case "email-already-in-use":
          log(e.code);
        default:
          log(e.code);
      }
      return false;
    }
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
