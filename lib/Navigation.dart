import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registrationapp/Profile.dart';
import 'Notifications.dart';
import 'News_trends.dart';
import 'Settings.dart';
import 'Logout.dart';
import 'Upload.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> list =[

    MainHome(),
    Profile(),
    News(),
    Notifications(),
    Settings(),
    Logout(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:Center(child: Text('ZERO HUNGER')),
      ),

      body: list[index],
      drawer: MyDrawer(
        //onTap function takes two parameters context and i for index
        onTap:(ctx,i){
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
      }
      ),
    );
  }
}
class MyDrawer extends StatelessWidget {

  final Function onTap;
 final Color colour;
  MyDrawer({this.onTap,this.colour});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(

              decoration: BoxDecoration(color: Colors.green,),
              child: Padding(padding: EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('image/icon4.jpg'),
                      backgroundColor: Colors.white,

                    ),
                  ),
//                  SizedBox(
//                    height: 10.0,
//                  ),
//                 // Text('farmer\'s name ',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600),),
//                 // SizedBox(
//                    height: 3.0,
//                  ),
                 // Text('farmer@gmail.com ',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                ],
              ),),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => onTap(context,0),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => onTap(context,1),
            ),
            ListTile(
              leading: Icon(Icons.markunread),
              title: Text('News and Trends'),
              onTap: () => onTap(context,2),
            ),
            ListTile(
              leading: Icon(Icons.notification_important),
              title: Text('Notifications'),
              onTap: () => onTap(context,3),
            ),
            Divider(height: 5.0,),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => onTap(context,4),
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app,),
              title: Text('Logout'),
              onTap: () => onTap(context,5),
            ),
          ],
        ),
      ),
    );
  }
}
