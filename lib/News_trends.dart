import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*  child: Center(
        child: Text('this page will contain, news and trends,markets and crop guides'),
      ),*/

      appBar: new  AppBar(
        title: new Text("Farming trends"),
        backgroundColor: Colors.green,

      ),
      body: new ListView(
        children: <Widget>[

          new Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: new ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image: new AssetImage('image/market1.jpeg'),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),




                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image: new AssetImage('image/market2.jpeg'),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image: new AssetImage('image/market3.jpeg'),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(17.0),
                    child: new Image(
                      image: new AssetImage('image/market4.jpeg'),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


              ],
            ),
          )

        ],
      ),

    );
  }

}