import 'package:flutter/cupertino.dart';
import 'package:cable_payments/home.dart';
import 'package:cable_payments/login.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authcontroller extends GetxController{
  static Authcontroller instance =Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth =FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user=Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialscreen );
  }
  _initialscreen(User? user){
    if(user==null){
      print("login page");
      Get.offAll(()=>loginscreen());
    }else{
      Get.offAll(()=>homescreen());
    }
  }

   register(String email,password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User message",backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,titleText: Text("Acount creation failed",style: TextStyle
            (color: Colors.white),),
          messageText: Text(e.toString(),style: TextStyle
            (color: Colors.white),)
      );
    }
  }
}