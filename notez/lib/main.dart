

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notez/components/auth.dart';
import 'package:notez/screens/setupPage.dart';
import 'package:notez/screens/signUpPage.dart';
import 'firebase_options.dart';

// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:theme_provider/theme_provider.dart';

import 'screens/home_screen.dart';
final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MaterialApp(home:landingPage(), title: 'Memori',navigatorKey: navigatorKey,debugShowCheckedModeBanner: false,) );
}

class landingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return MyApp();
          }
          else{
            //return AuthPage();
            return setupPage();
          }
          },
      ),
    );
  }
}



class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return NeumorphicApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'Memori',
            theme: const NeumorphicThemeData(
              baseColor: Colors.white,
              lightSource: LightSource.left,
              intensity: 0.7,
            ),
            darkTheme: const NeumorphicThemeData(
                baseColor: Color(0xFF3E3E3E),
                lightSource: LightSource.right,
                depth: 6,
                intensity: 0.5),
            themeMode: currentMode,
            home: HomeScreen(),
          );
        });
  }
}
