import 'package:flutter/material.dart';
import 'package:registrationapp/Splash.dart';
import 'Splash.dart';
import 'Navigation.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero hunger',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),

      );
  }
}
