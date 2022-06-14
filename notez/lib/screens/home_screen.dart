import 'dart:math';

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
  late AuthUser userr;


  late double difference;
  late int totalWeeks;
  late double lived;

  //static late final uzer;

  bool isDarkMode() => MyApp.themeNotifier.value == ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    
    readUser();
    //double difference;
    // int totalWeeks;
    // double lived;
    double aspectRatio;
    //DateTime.parse(userr.bd).add(Duration(days: userr.life*365));

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                profileName(),
                dayNight(),
                SizedBox(
                  width: 55,
                ),
                out()
              ],
            ),
            FutureBuilder(
                future: readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    
                    totalWeeks = 52 * userr.life;
                      final weeks = List.generate(7800, (index) => index);
                    difference = (DateTime.now()
                            .difference(DateTime.parse(userr.bd))
                            .inDays) /
                        7;
                    lived = (((totalWeeks - difference) / totalWeeks) * 100);
                    aspectRatio = 52 / totalWeeks;

                    return Expanded(
                      child: Column(children: [
                        Row(children: [
                          SizedBox(width: 10),
                          Text(
                            'Life Progress: ${(100 - lived).toStringAsFixed(1)}%',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          )
                        ]),
                        Row(children: [
                          SizedBox(width: 10),
                          RichText(
                            text: TextSpan(
                                text: '${difference.toInt()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                children: [
                                  TextSpan(
                                      text:
                                          ' weeks spent | ${(totalWeeks - difference).toInt()} weeks left')
                                ]),
                          ),
                        ]),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  // childAspectRatio: aspectRatio,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2,
                                  crossAxisCount: 52,
                                ),
                                itemCount: 4100,
                                itemBuilder: (context, index) {
                                  final item = weeks[index];

                                  return buildWeeks(item);
                                }),
                          ),
                        ),
                      ]),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })

            //profile(),
          ],
        ),
      ),
    );
  }

  Widget buildWeeks(int number) {
    if (number>totalWeeks){
      return Container();
    }
    else if (number > difference) {
      return Container(color: Color.fromARGB(179, 214, 211, 211));
    } else if (number < 286) {
      return Container(
        color: Colors.lightBlue,
      );
    } else if (number < 598) {
      return Container(
        color: Colors.teal,
      );
    } else if (number < 936) {
      return Container(
        color: Colors.yellow,
      );
    } else if (number < 1144) {
      return Container(
        color: Colors.orangeAccent,
      );
    } else if (number < 3224) {
      return Container(
        color: Colors.redAccent,
      );
    }

    return Container(
      color: number > difference
          ? Color.fromARGB(179, 214, 211, 211)
          : Colors.orange,
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
        userr = AuthUser.fromJson(snapshot.data()!);
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
            Navigator.push(
                context,
                CustomPageRouteBuilder(
                    widget: profile(
                  uzer: uzer,
                )));
          },
      )),
    );
  }

  IconButton out() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      iconSize: 35,
      color: Colors.white,
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
        dispose();
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      },
    );
  }

  ElevatedButton signOut() {
    return ElevatedButton(
      child: const Text('Sign Out'),
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
        dispose();
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      },
    );
  }

  NeumorphicSwitch dayNight() {
    return NeumorphicSwitch(
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

        lightSource:
            !status ? const LightSource(0.9, 0) : const LightSource(-1, -0),
        trackBorder: NeumorphicBorder(
          color: !status ? const Color(0xFF76aec1) : Colors.black87,
          width: 5,
        ),
        inactiveThumbColor: const Color(0xFFf5ec27),
        inactiveTrackColor: const Color(0xFF83c1d6),
        activeThumbColor: const Color(0xFF9e9e96),
        activeTrackColor: const Color(0xFF484848),

        thumbBorder: NeumorphicBorder(
            color: !status ? const Color(0xFFe4c741) : const Color(0xFF65645f),
            width: 4.5),
      ),
    );
  }
}
