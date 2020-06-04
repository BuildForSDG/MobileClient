
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Posts.dart';
import 'HomePage.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  File sampleImage;
  String _myInput;
  String url;
  final formKey = new GlobalKey<FormState>();





  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage=tempImage;
    });

  }
  bool validateAndSave(){
    final form = formKey.currentState;

    if(form.validate()){
      form.save();


    }
    return true;

  }
  void uploadStatusImage() async{
    if (validateAndSave()){
      final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('Post');
      var timeKey = DateTime.now();
      final StorageUploadTask task = firebaseStorageRef.child(timeKey.toString() +'.jpg').putFile(sampleImage);

      var imgUrl = await(await task.onComplete).ref.getDownloadURL();
      url =imgUrl.toString();

      saveToDatabase(url);
      goToHomePage();


    }
  }
  void saveToDatabase(url){
    var timeKey = DateTime.now();
    var formatDate = DateFormat('MM,d,yyyy');
    var formatTime = DateFormat('EEE,hh:mm,aaa');

    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);

    DatabaseReference databaseReference =FirebaseDatabase.instance.reference();

    var  data ={
      'image':url,
      'description': _myInput,
      'date' : date,
      'time' : time,

    };
    databaseReference.child('my posts').push().set(data);

  }
  void goToHomePage(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child:  Column(
        children: <Widget>[

          Container(
            child: sampleImage == null? Text('Select an Image'): enableUpload(),
          ),
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: getImage,
        tooltip: 'Upload Image',
        child: Icon(Icons.camera_alt,color: Colors.green,),
      ),
    );
  }
  Widget enableUpload(){
    return Container(

      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(sampleImage,height:200.0,width: 200.0,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                maxLines: null,

                validator: (input) {
                  return input.isEmpty? 'Picture description is required': null;
                },
                onSaved: (input){
                  return _myInput = input;
                },
                decoration: InputDecoration(

                  prefixIcon: Icon(
                    Icons.edit,
                    size: 15.0,
                    color: Colors.green,
                  ),

                  labelText: 'Description is required',

                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(color: Colors.white, width: 50.0),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            RaisedButton(
              elevation: 10.0,
              child: Text('Upload'),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){
                uploadStatusImage();

              },)
          ],
        ),
      ),
    );
  }
}
