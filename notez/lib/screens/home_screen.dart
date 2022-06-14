import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:notez/components/user.dart';
import 'package:notez/constants.dart' as constants;
import 'package:notez/screens/profile.dart';
import 'package:notez/utils/customePageRoute.dart';
import '../main.dart';

// Home Screen
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<HomeScreen> {
  bool status = MyApp.themeNotifier.value == ThemeMode.dark;
  final user = FirebaseAuth.instance.currentUser!;
  //static late final uzer;

  bool isDarkMode() => MyApp.themeNotifier.value == ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [profileName(), dayNight()],
            ),
          
            ElevatedButton(
              child: const Text('Go to Other Screen'),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                          child: CircularProgressIndicator(),
                        ));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const OtherScreen()));
                FirebaseAuth.instance.signOut();
                navigatorKey.currentState!.popUntil((route) => route.isFirst);
              },
            ),
            //profile(),
          ],
        ),
      ),
    );
  }

  Future<AuthUser?> readUser() async {
    final docUser =
        FirebaseFirestore.instance.collection('UsersData').doc(user.uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      try {
        // if (AuthUser.fromJson(snapshot.data()!).bd.isNotEmpty){
        //   setState(() {
        //   });
        // };
        return AuthUser.fromJson(snapshot.data()!);
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  FutureBuilder<AuthUser?> profileName() {
    return FutureBuilder(
        future: readUser(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final uzer = snapshot.data;

            return uzer == null
                ? Center(child: Text('Loading'))
                : buildUser(uzer);
          } else {
            return Text('Loading');
          }
        }));
  }

  Widget buildUser(AuthUser uzer) {
    return Padding(
      padding: const EdgeInsets.all(12.0).copyWith(top: 15),
      child: RichText(
          text: TextSpan(
        text: uzer.name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: NeumorphicTheme.of(context)!.isUsingDark
                ? Colors.white
                : Colors.black),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(context, CustomPageRouteBuilder(widget: profile(uzer: uzer,)));
          },
      )),
    );
  }
  NeumorphicSwitch dayNight () {
    return   NeumorphicSwitch(
              curve: Neumorphic.DEFAULT_CURVE,
              height: 40,
              value: status,
              onChanged: (val) {
                setState(() {
                  status = val;
                  if (val) {
                    MyApp.themeNotifier.value = ThemeMode.dark;
                  } else {
                    MyApp.themeNotifier.value = ThemeMode.light;
                  }
                });
              },
              style: NeumorphicSwitchStyle(
                // thumbShape: NeumorphicShape.concave,
                thumbDepth: 10,
                trackDepth: 10,

                lightSource: !status
                    ? const LightSource(0.9, 0)
                    : const LightSource(-1, -0),
                trackBorder: NeumorphicBorder(
                  color: !status ? const Color(0xFF76aec1) : Colors.black87,
                  width: 5,
                ),
                inactiveThumbColor: const Color(0xFFf5ec27),
                inactiveTrackColor: const Color(0xFF83c1d6),
                activeThumbColor: const Color(0xFF9e9e96),
                activeTrackColor: const Color(0xFF484848),

                thumbBorder: NeumorphicBorder(
                    color: !status
                        ? const Color(0xFFe4c741)
                        : const Color(0xFF65645f),
                    width: 4.5),
              ),
            );
  }

}

