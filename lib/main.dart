import 'package:flutter/material.dart';
//import 'package:registrationapp/Sign_Up.dart';

import 'Home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero hunger',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new HomePage(),

      );
  }
}
