import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:notez/constants.dart' as constants;
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

  bool isDarkMode() => MyApp.themeNotifier.value == ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            constants.moon,
            NeumorphicSwitch(
              curve: Neumorphic.DEFAULT_CURVE,
              height: 40,
              value: status,
              onChanged: (val){
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
                
              lightSource: !status ?const LightSource(0.9, 0): const LightSource(-1, -0),
                  trackBorder: NeumorphicBorder(
                    color: !status ? const Color(0xFF76aec1) : Colors.black87,
                    width: 5,
                  ),
                  inactiveThumbColor: const Color(0xFFf5ec27),
                  inactiveTrackColor: const Color(0xFF83c1d6),
                  activeThumbColor: const Color(0xFF9e9e96),
                  activeTrackColor: const Color(0xFF484848),
                  
                  thumbBorder:
                      NeumorphicBorder(color: !status ? const Color(0xFFe4c741): const Color(0xFF65645f), width: 4.5),
                      ),
            ),
            // NeumorphicButton(
            //   child: const Text('go next'),
            //   onPressed: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=> const OtherScreen()));
            //   },
            // ),
            ElevatedButton(
              child: const Text('Go to Other Screen'),
              onPressed: () {
                showDialog(context: context, barrierDismissible: false, builder: (context) => Center(child: CircularProgressIndicator(),));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const OtherScreen()));
                FirebaseAuth.instance.signOut();
                navigatorKey.currentState!.popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Other Screen
class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Screen'),
      ),
      body: const Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
