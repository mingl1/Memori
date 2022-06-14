import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:notez/components/user.dart';
import 'package:notez/main.dart';
import 'package:notez/screens/home_screen.dart';
import 'package:notez/screens/setupPage.dart';

class AuthPage2 extends StatefulWidget {
  AuthPage2({Key? key}) : super(key: key);

  @override
  State<AuthPage2> createState() => _AuthPageState2();
}

class _AuthPageState2 extends State<AuthPage2> {
  final user = FirebaseAuth.instance.currentUser;
  bool isFirst = false;
  
  @override
  Widget build(BuildContext context) {
    readUser();
    return NeumorphicApp(home: isFirst ? setupPage() : MyApp());
  }

Future<bool?> readUser() async {
    final docUser =
        FirebaseFirestore.instance.collection('UsersData').doc(user!.uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      try {
        // if (AuthUser.fromJson(snapshot.data()!).bd.isNotEmpty){
        //   setState(() {
        //   });
        // };
        //print('checkeddddddddddddddddd');
        setState(() {
          isFirst =  AuthUser.fromJson(snapshot.data()!).bd.isEmpty;

        });

      } on Exception catch (e) {
        print(e);
      }
    }
    return null;
  }
}
