import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CustomInput.dart';
import 'HomePage.dart';



class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<Login>{
  // final String keytologin = '2345';
  static final _formkey= new GlobalKey<FormState>();
 String _email,_password;
//  bool isCorrect = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.cyan,

        child: Stack(
          children:<Widget>[
            Align(
              alignment: Alignment.bottomRight,
              widthFactor: 0.5,
              heightFactor: 0.5,
              child:Material(
                color:Color.fromRGBO(255,255,255,0.4),
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: Container(
                  width: 400,
                  height: 400,
                  ),
                ),),
            Align(
              alignment: Alignment.bottomLeft,
              widthFactor: 0.2,
              heightFactor: 0.2,
              child:Material(
                color:Color.fromRGBO(255,255,255,0.4),
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: Container(
                  width: 400,
                  height: 400,
                  ),
                ),),
            Center(
              child: Container(
                
                width: 400,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                        elevation:10.0,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('images/homesec.png',width:100,height:100))),
                            CustomInput(Icon(Icons.email, color: Colors.white), 'Email','_email'),
                            SizedBox(height:5.0),
                            CustomInput(Icon(Icons.lock, color: Colors.white), 'Password','_password'),
                   SizedBox(height:5.0),
                   Container(
                      width:150,
                      height:150,
                      child: ListView(children: <Widget>[RaisedButton(onPressed: keyIn,              // (mycontroller.text==keytologin)?
                      color:Colors.cyanAccent,textColor:Colors.white,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                            child:Text('Login',style: TextStyle(
                                                fontSize: 20.0
                                                ),),
                                          )
                            ],)),
                   
                    

                                          ],),),
                  )]),
                  
                ));
                      }
              
        Future <void> keyIn() async{
          //  final formState =_formkey.currentState;
                    if(_formkey.currentState.validate()){
                        _formkey.currentState.save();
                            try{          
                              FirebaseAuth user= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) as FirebaseAuth;
                              Navigator.push(context,MaterialPageRoute(
                                        builder: (context) => HomePage( user)
                                        ));
                              }catch(e){
                                print(e.message);
      }
      }
  }
}