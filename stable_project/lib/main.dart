import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homeapp/Screens/HomePage.dart';



void main(){

   FirebaseAuth user;
     runApp(MaterialApp(
        home: HomePage (user)
));//MaterialApp

}
