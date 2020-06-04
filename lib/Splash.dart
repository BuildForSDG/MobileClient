import 'dart:async';
import 'Sign_Up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder:(context)   => SignUp(),),),);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('image/logo4.jpg'),
                      ),
                      SizedBox(height: 10.0,),
                      Text('ZERO HUNGER', style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight:FontWeight.bold),),
                    ],
                  ),
                ),),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(backgroundColor: Colors.white),
                  SizedBox(height: 20),
                  Text('Provide solutions to everyday Farmers ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                ],
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
