import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notez/components/user.dart';
import 'package:notez/screens/home_screen.dart';
import 'package:notez/screens/setupPage.dart';
import 'package:notez/utils/customePageRoute.dart';

class profile extends StatefulWidget {
  final AuthUser uzer;
  profile( {Key? key, required this.uzer}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final user = FirebaseAuth.instance.currentUser!;
  bool bd = false;
  final items =
      List<String>.generate(140, (counter) => "${counter + 10} years");

  DateTime selectedDate = DateTime(2004, 6, 9);
// index is life expectancy-10
  int index = 70;
  @override
  Widget build(BuildContext context) {
    index = widget.uzer.life-10;
    selectedDate = DateTime.parse(widget.uzer.bd);
    return profilePage();
  }
  
  Widget profilePage() {
        final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              color: Colors.grey.shade500,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.symmetric().copyWith(top: 10),
                child: Center(
                    child: Text(
                  'Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white),
                )),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(bottom: 10)
                      .copyWith(top: 30)
                      .copyWith(right: 20),
                  child: Container(
                    height: height / 13,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Your Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.5),
                            ),
                          ),
                          SizedBox(
                            width: 55,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 130,

                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Center(
                                  child: RichText(
                                text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now(),);
                                      //showCupertinoModalPopup(context: context, builder: builder)
                                      showDatePicker();
                                    },
                                  text: widget.uzer.name,
                                  //yMMMMEd().format(selectedDate),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5,
                                      color: Colors.black),
                                ),
                              )),
                              // child: CupertinoDatePicker(
                              //   onDateTimeChanged: (value) {
                              //     if (value != null && value != selectedDate)
                              //       setState(() {
                              //         selectedDate = value;
                              //       });
                              //   },
                              //   mode: CupertinoDatePickerMode.date,
                              //   initialDateTime: DateTime.now(),
                              //   maximumYear: DateTime.now().year,
                              // )
                            ),
                          )
                        ]),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(bottom: 10)
                      .copyWith(top: 30)
                      .copyWith(right: 20),
                  child: Container(
                    height: height / 13,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Your Birth Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.5),
                            ),
                          ),
                          SizedBox(
                            width: 55,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 130,

                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Center(
                                  child: RichText(
                                text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now(),);
                                      //showCupertinoModalPopup(context: context, builder: builder)
                                      showDatePicker();
                                    },
                                  text: DateFormat.yMMMd().format(selectedDate),
                                  //yMMMMEd().format(selectedDate),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5,
                                      color: Colors.black),
                                ),
                              )),
                              // child: CupertinoDatePicker(
                              //   onDateTimeChanged: (value) {
                              //     if (value != null && value != selectedDate)
                              //       setState(() {
                              //         selectedDate = value;
                              //       });
                              //   },
                              //   mode: CupertinoDatePickerMode.date,
                              //   initialDateTime: DateTime.now(),
                              //   maximumYear: DateTime.now().year,
                              // )
                            ),
                          )
                        ]),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 10)
                    .copyWith(top: 30)
                    .copyWith(right: 20),
                child: Container(
                  height: height / 3,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Life Expectancy',
                            style: TextStyle(
                                fontSize: 16.5, fontWeight: FontWeight.bold),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: height / 3 - 35,
                        child: CupertinoPicker(
                          scrollController:
                              FixedExtentScrollController(initialItem: index),
                          useMagnifier: true,
                          itemExtent: 40,
                          children: items.map((e) {
                            return Center(
                              child: Text(
                                e,
                                style:
                                    TextStyle(fontSize: 35, color: getColor(e)),
                              ),
                            );
                          }).toList(),
                          onSelectedItemChanged: (index) {
                            setState(() {
                              this.index = index + 10;
                            });
                          },
                          backgroundColor: null,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  submit();
                },
                child: Container(
                  height: 53,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12.withOpacity(.2),
                            offset: const Offset(2, 2))
                      ],
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(100)),
                      gradient: LinearGradient(
                          colors: [Color(0xFFa687ad), Color(0xFFa191bc)])),
                  child: Text('Memento Mori',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(String x) {
    int hold = int.parse(x.replaceAll(new RegExp(r'[^0-9]'), ''));

    // if (hold<30){
    return Color.fromARGB(255, 0, 0, 0)
        .withRed(truncate(255 - (hold)))
        .withBlue(truncate((1.7 * hold).toInt()));
    // }
    // else if (hold<50){
    //   return Colors.blue;
    // }
    // else return Colors.purple;
  }

  int truncate(int x) {
    if (x > 255) {
      return 80;
    } else
      return x;
  }

  void showDatePicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                if (value != null && value != selectedDate)
                  setState(() {
                    selectedDate = value;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
            ),
          );
        });
  }

  Future submit() async {
    try {
      FirebaseFirestore.instance
          .collection('UsersData')
          .doc(user.uid)
          .update({'birthdate': selectedDate.toString(), 'life': index + 10});
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.push(context, CustomPageRouteBuilder(widget: HomeScreen()));

  }
}


