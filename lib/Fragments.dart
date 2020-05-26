import 'package:flutter/material.dart';

//Let's create a reusable method that can render GridView as long as it passed a
//a BuildContext as well as list of strings
Widget createGridView(BuildContext context,List<String> cosmicBodies) {

  //I will shuffle my data
  cosmicBodies.shuffle();

  // Then build my GridView and return it
  return new GridView.builder(
      itemCount: cosmicBodies.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0,left: 10.0),
              child: new Text(cosmicBodies[index]),
            ),
          ),
        );
      }
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var home = ["Tunguska","Crab Pulsar","Geminga","Calvera","Vela X-1","Gaspra",
      "Psyche","Pallas","Ceres","Pioneer","Haumea","Makemake","Eris"];

    return createGridView(context, home);
  }
}

//Create Notifications Fragment. This will contains a gridview with our notifications
class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var notifications = ["Tunguska","Crab Pulsar","Geminga","Calvera","Vela X-1","Gaspra",
      "Psyche","Pallas","Ceres","Pioneer","Haumea","Makemake","Eris"];

    return createGridView(context, notifications);
  }
}

//Create News Fragment. This will contains a gridview with our moons
class News  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var news  =  ["Phobos","Deimos","Moon","Triton","Proteus","Oberon","Umbriel","Ariel","Titan",
      "Rhea","Lapetus","Dione","Enceladus","Mimas","Ganymede","Callisto","IO","Europa"];

    return createGridView(context, news );
  }
}

//Create market Fragment. This will contains a gridview with our stars
class Markets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var markets = ["UY Scuti","VY Cani Majoris","VV Cephei","KY Cygni","Aldebaran","Canopus",
      "Sirius","Vega","Alpha Pegasi","Bellatrix","Pollux","Betelgeuse","Naos","Arcturus","Polaris",
      "Rigel","Deneb","Wezen","Antares","Eya Caninae"];

    return createGridView(context, markets);
  }
}

//Disease and treatments  Fragment. This will contains a grid view with our disease and treatments
class Disease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var disease = ["Messier 87","Andromeda","Sombrero","Whirlpool","Pinwheel","Milky Way",
      "Cartwheel", "Black Eye Galaxy","Star Bust","Centaurus","Triangulum","Sunflower",
      "Caldwell","Tadpole","Hoag's Object","Mallin 1","NGC 262","IC 1101"];

    return createGridView(context, disease);
  }
}
// weather forecasting Fragment. this contains weather patterns to be observed by farmers
class Weather  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var weather = ["Rain patterns","Sunny","Rainy","Temperatures","Humidity","Rainfall",];

    return createGridView(context, weather);
  }
}



// settings Fragments. this contains settings activities


class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var settings = ["settings functionality"];

    return createGridView(context, settings);
  }
}
