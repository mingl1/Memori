import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:notez/constants.dart' as Constants;
import '../main.dart';

// Home Screen
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  
  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<HomeScreen>{
  bool status = MyApp.themeNotifier.value == ThemeMode.dark;

  bool isDarkMode() => MyApp.themeNotifier.value==ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: Center(
        child: Column(
          children: [
            FlutterSwitch(
               width: 100.0,
                      height: 55.0,
                      toggleSize: 45.0,
                      borderRadius: 30.0,
                      padding: 2.0,
                      activeToggleColor: Color(0xFF6E40C9),
                      inactiveToggleColor: Color(0xFF2F363D),
                      activeSwitchBorder: Border.all(
                        color: Color(0xFF3C1E70),
                        width: 6.0,
                      ),
                      inactiveSwitchBorder: Border.all(
                        color: Color(0xFFD1D5DA),
                        width: 6.0,
                      ),
                      activeColor: Color(0xFF271052),
                      inactiveColor: Colors.white,
                      activeIcon: Icon(
                        Icons.nightlight_round,
                        color: Color(0xFFF8E3A1),
                      ),
                      inactiveIcon: Icon(
                        Icons.wb_sunny,
                        color: Color(0xFFFFDF5D),
                      ),
                value: status,
                onToggle: (val) {
                  setState(() {
                     status = val;
                     if (val){
                       MyApp.themeNotifier.value = ThemeMode.dark;
                     }
                     else{
                       MyApp.themeNotifier.value = ThemeMode.light;
                     }
                  });
                  }),
            ElevatedButton(
              child: const Text('Go to Other Screen'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OtherScreen()));
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
