import 'package:registrationapp/Fragments.dart' as Fragments;
import 'package:flutter/material.dart';

//Let's define a DrawerItem data object
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
// Our Homepage
class HomePage extends StatefulWidget {
  //Let's define our drawer items, strings and images
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Profile", Icons.person),
    new DrawerItem("News & trends", Icons.markunread),
    new DrawerItem("Markets", Icons.place),
    new DrawerItem("Notifications", Icons.notifications),
    new DrawerItem("Crop guide", Icons.crop_portrait),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Weather forecast", Icons.cloud)
  ];
  //Let's Create and Return state for this 'StatefulWidget'
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}
// Let's define state for our homepage. A state is just information for a widget.
class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  //  switch statements to return the Fragment for a selected item
  _getDrawerFragment(int pos) {
    switch (pos) {
      case 0:
        return new Fragments.Notifications();
      case 1:
        return new Fragments.News();
      case 2:
        return new Fragments.Markets();
      case 3:
        return new Fragments.Disease();

      case 4:
        return new  Fragments.Settings();

      case 5:
        return new  Fragments.Weather();
      case 6:
        return new  Fragments.Home();

      default:
        return new Text("Error");
    }
  }
  //Let's update the selectedDrawerItemIndex the close the drawer
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    //we close the drawer
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    //Let's create drawer list items. Each will have an icon and text
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }
    //Let's scaffold our homepage
    return new Scaffold(
      appBar: new AppBar(
        // We will dynamically display title of selected page
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      // Let's register our Drawer to the Scaffold
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            //Lets Create a material design drawer header with account name, email,avatar
            new UserAccountsDrawerHeader(
              accountName: new Text("Zero hunger"),
              accountEmail: new Text("farmer@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage ('assets/logo1.jpg'),),
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(colors: <Color>[
                    Colors.green,
                    Colors.lightGreen,
                  ]

                  ),
                  image: new DecorationImage(
                      image: new AssetImage("assets/logo1.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerFragment(_selectedDrawerIndex),
    );
  }
}
