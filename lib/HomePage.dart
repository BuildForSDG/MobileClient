import 'package:flutter/material.dart';


import 'package:firebase_database/firebase_database.dart';
import 'Posts.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Posts> postList =[];

  @override
  void initState(){

    super.initState();
    DatabaseReference postsReference =FirebaseDatabase.instance.reference().child('Post');
    postsReference.once().then((DataSnapshot snap) {
      var KEYS =snap.value.keys;
      var DATA = snap.value;

      postList.clear();

      for(var individualKey in KEYS)
      {
        Posts posts = new Posts(
          DATA[individualKey]['image'],
          DATA[individualKey]['description'],
          DATA[individualKey]['time'],
          DATA[individualKey]['date'],

        );
        postList.add(posts);
      }
      setState(() {
        print('length: $postList.length');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: postList.length == 0? Text('add photo'):ListView.builder(itemCount:postList.length,itemBuilder: (_, index){
          return postUI(postList[index].image,postList[index].description,postList[index].date,postList[index].time);
        }),
      ),
    );
  }
  Widget postUI(String image,String description,String date,String time,){
    return Card(
      margin: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(date,style:Theme.of(context).textTheme.subtitle,textAlign: TextAlign.center,),
                Text(time,style:Theme.of(context).textTheme.subtitle,textAlign: TextAlign.center,),
              ],
            ),
            SizedBox(height: 5.0,),
            Image.asset(image,fit: BoxFit.cover,),
            SizedBox(height: 5.0,),
            Text(description,style:Theme.of(context).textTheme.subtitle,textAlign: TextAlign.center,),

          ],
        ),
      ),
    );
  }
}
