import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:notez/constants.dart'as constants;
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
            constants.moon,
            FlutterSwitch(
               width: 100.0,
                      height: 60.0,
                      toggleSize: 53,
                      borderRadius: 100.0,
                      padding: 0.0,
                      togglePadding: const EdgeInsets.all(0),
                      activeToggleColor: const Color(0xFFb5b79d),
                      inactiveToggleColor: const Color(0xFFf5ec27),
                     activeSwitchBorder: Border.all(color: Colors.black, width: 5),
                      activeColor: const Color(0xFF484848),
                      inactiveColor: const Color(0xFFbfe6f6),
                      inactiveToggleBorder:  Border.all(color: Color(0xFFe4c741), width: 5),
                      inactiveSwitchBorder: Border.all(color: Color(0xFF83c1d6), width: 5),
                      activeIcon: constants.moon,
                     //inactiveIcon: Container(child:Image.asset('assets/button_icons/moon2.png', fit: BoxFit.fill,), height: 100,),
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
