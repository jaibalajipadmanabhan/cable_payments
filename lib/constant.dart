import 'package:cable_payments/home.dart';
import 'package:cable_payments/login.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
class constant extends StatefulWidget {
  const constant({Key? key}) : super(key: key);

  @override
  State<constant> createState() => _constantState();
}

class _constantState extends State<constant> {
  @override
  late User user;
  Widget build(BuildContext context) {
    if(user==null){
      return loginscreen();
    }
    return homescreen();
  }
}



const String img1="assets/ant.jpg";
const String img2="assets/signup.jpg";
const String appname="Digital Cable";
const String slogan="payment app";
const String login="LOGIN";

