import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image= File(pickedFile.path);
    });

  }


  @override
  Widget build(BuildContext context) {

    Future uploadPic(BuildContext context) async{
      String fileName= basename(_image.path);
      StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = ref.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile picture uploaded')));
      });
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.green,

            ),
            clipper: GetClipper(),
          ),
          Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height/9.5,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Edit profile',style: TextStyle(color: Colors.white,fontSize: 25.0),),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Center(
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            image: DecorationImage(
                              image: (_image == null)?AssetImage('image/icon2.jpg'): FileImage(_image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(90.0),),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton( onPressed:(){
                          getImage();
                        },
                            icon: Icon(Icons.camera_alt, color: Colors.green,size: 30.0,)),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.0,),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment:Alignment.centerLeft,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                 alignment:Alignment.centerLeft,
                                     child: Text('Username', style:TextStyle(color: Colors.grey.shade700,fontSize: 20.0),),
                                 ),
                                 Align(
                                    alignment:Alignment.centerLeft,
                                       child: Text('Farmer\'s name', style:TextStyle(color: Colors.grey.shade700,fontSize: 15.0,fontWeight: FontWeight.bold,letterSpacing: 1.0),),
                                  ),

                               ],
                          ),
                        ),
                        ),
                        Align(
                          alignment:Alignment.centerLeft,
                          child: Container(
                            child: Icon(Icons.edit, color: Colors.grey.shade700,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment:Alignment.centerLeft,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment:Alignment.centerLeft,
                                  child: Text('Change Email Address', style:TextStyle(color: Colors.grey.shade700,fontSize: 20.0),),
                                ),
                                Align(
                                  alignment:Alignment.centerLeft,
                                  child: Text('farmer@gmail.com', style:TextStyle(color: Colors.grey.shade700,fontSize: 15.0,fontWeight: FontWeight.bold,letterSpacing: 1.0),),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment:Alignment.centerLeft,
                          child: Container(
                            child: Icon(Icons.edit, color: Colors.grey.shade700,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment:Alignment.centerLeft,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment:Alignment.centerLeft,
                                  child: Text('Delete Account', style:TextStyle(color: Colors.grey.shade700,fontSize: 20.0),),
                                ),
                                Align(
                                  alignment:Alignment.centerLeft,
                                  child: Text(' ', style:TextStyle(color: Colors.grey.shade700,fontSize: 15.0,fontWeight: FontWeight.bold,letterSpacing: 1.0),),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment:Alignment.centerLeft,
                          child: Container(
                            child: Icon(Icons.edit, color: Colors.grey.shade700,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(onPressed: (){
                        uploadPic(context);
                      },
                        color: Colors.green,

                        child: Text('Update'),),
                      RaisedButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                        color: Colors.green,

                        child: Text('Cancel'),),

                    ],
                  ),
                ],
              ),
            ),

          ),

        ],
      ),

    );

  }

}

void _handleImage(PickedFile file) {

}

class GetClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size){

    var path = new Path();
    path.lineTo(0.0, size.height/2.0);
    path.lineTo( size.width+125, 0.0);
    path.close();
    return path;
  }
  @override
   bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;

  }

}

