//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class setupPage extends StatefulWidget {
  const setupPage({Key? key}) : super(key: key);

  @override
  _setupPageState createState() => _setupPageState();
}

class _setupPageState extends State<setupPage> {
  //final user = FirebaseAuth.instance.currentUser!;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(bottom: 10)
                      .copyWith(top: 30)
                      .copyWith(right: 20),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Your Birth Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.5),
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 130,

                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                              child: Text(
                            DateFormat.yMMMMd('en_US').format(selectedDate),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.5),
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
                  height: 200,
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
                    
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
