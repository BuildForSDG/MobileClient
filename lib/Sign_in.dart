import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Navigation.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'Sign_Up.dart';
import 'package:toast/toast.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  ProgressDialog progressDialog;
  String _email, _password,_user;
  //create a global key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

     progressDialog = ProgressDialog(context,type: ProgressDialogType.Normal);
     progressDialog.style(
         message: 'Login...',
         borderRadius: 10.0,
         backgroundColor: Colors.white,
         progressWidget: CircularProgressIndicator(),
         elevation: 10.0,
         insetAnimCurve: Curves.easeInOut,
         progress: 0.0,
         maxProgress: 100.0,
         progressTextStyle: TextStyle(
             color: Colors.green, fontSize: 13.0, fontWeight: FontWeight.w400),
         messageTextStyle: TextStyle(
             color: Colors.green, fontSize: 19.0, fontWeight: FontWeight.w600)
     );


    return Scaffold(

      body: SingleChildScrollView(

        child: Container(
          child: Form(
            //implement key
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage('image/icon2.jpg'),
                ),
                SizedBox(
                  height: 20.0,
                  child: Text('Login page'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'PLease enter your Username ';
                      }
                    },
                    onSaved: (input) => _user = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: 15.0,
                      ),
                      labelText: 'Username ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'PLease enter the correct  Email ';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        size: 15.0,
                      ),
                      labelText: 'Email ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (input) {
                      if (input.length < 6) {
                        return 'please enter the correct password';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.remove_red_eye,
                        size: 15.0,
                      ),
                      labelText: 'Password ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    signIn();
                    progressDialog.show();
                    Toast.show("Login Successful", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP,backgroundColor: Colors.green);
                  },
                  child: Text('Sign in'),
                ),
                FlatButton(
                  onPressed:(){  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SignUp()));},

                  child: Text('Don\'t have an Account? Register', style: TextStyle(color:Colors.green),),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    //validate the fields
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));

      } catch (e) {
        print(e);
      }
    }
    else{
      return SignUp();
    }
  }
}
