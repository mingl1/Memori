import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notez/screens/signInPage.dart';
import 'package:notez/screens/signUpPage.dart';

// class Authentication{
//   final FirebaseAuth _firebaseAuth;
//   Authentication(this._firebaseAuth);

//   Stream<User?> authStateChanges (){return  _firebaseAuth.authStateChanges();}

//   Future<String> signIn({String email, String password}) async{
//  try {
//   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: emailAddress,
//     password: password
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }
//   }
// }

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: isLogin
            ? signUpWidget(onClickedSignIn: toggle)
            : signInWidget(onClickedSignIn: toggle));
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
