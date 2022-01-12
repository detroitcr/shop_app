import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIN = GoogleSignIn();


  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;


  Future googleLogin() async {
   try {
     final googleUser = await googleSignIN.signIn();
     if (googleUser == null) return;
     _user = googleUser;

     final googleAuth = await googleUser.authentication;

     final credential = GoogleAuthProvider.credential(
       idToken: googleAuth.idToken,
       accessToken: googleAuth.accessToken,
     );

     await FirebaseAuth.instance.signInWithCredential(credential);
   } catch(e){
     print(e.toString());
   }
notifyListeners();
  }


  Future logout() async {
    await googleSignIN.disconnect();
    FirebaseAuth.instance.signOut();
  }





}