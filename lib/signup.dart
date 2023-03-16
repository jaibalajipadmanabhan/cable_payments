import 'package:cable_payments/auth_control.dart';
import 'package:cable_payments/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cable_payments/reusable.dart';
import 'package:quickalert/quickalert.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  void showerr(QuickAlertType quick){
    QuickAlert.show(
        context: context,
        title: 'Signup',text: 'Account created successfully',
        type:  quick);
  }


  GlobalKey<FormState> formkey= GlobalKey<FormState>();
  bool pass=true;
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,title: Text("",style: TextStyle(fontSize: 0,fontWeight: FontWeight.bold),),
      ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(children: [Container(height: double.infinity,width: double.infinity,decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter,end:Alignment.bottomCenter,
                    colors: [Color(0xFFba16ba),Color(0xFF873987),Color(0xFF26507a)]
                )
            ),
            child: SingleChildScrollView(
              child: Padding(padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child:Form(
                  key: formkey,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Text('Sign Up', style: TextStyle(fontSize: 40,
                      fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                   SizedBox(height: 25,),
                 TextFormField (
                   controller: _username,
                     validator: (name){
                       if(name!.isEmpty){
                         return "enter username";
                       }else{
                         return null;
                       }
                     },style: TextStyle(color: Colors.white.withOpacity(0.9)),
                     decoration: InputDecoration(prefixIcon: Icon(Icons.person,color: Colors.white70,),
                    labelText: "Username",labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 0,style: BorderStyle.none)))
                ),
                   SizedBox(height: 25,),
                  TextFormField (
                    controller: _email,
                      validator: (_email) {
                        if (_email!.isEmpty)
                          return "enter your email";
                        else
                          return null;
                      },style: TextStyle(color: Colors.white.withOpacity(0.9)),
                      decoration: InputDecoration(prefixIcon: Icon(Icons.email,color: Colors.white70,),
                          labelText: "Email",labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0,style: BorderStyle.none)))
                  ),
                   SizedBox(height: 25,),
                  TextFormField (
                    controller: _password,
                      validator: (password) {
                        if (password!.isEmpty)
                          return "enter your password";
                        else if(password.length<8 || password.length>15)
                          return "password is invalid";
                        return null;
                      },style: TextStyle(color: Colors.white.withOpacity(0.9)),
                      obscureText: pass,
                      decoration: InputDecoration(prefixIcon: Icon(Icons.lock_open,color: Colors.white70,),
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              pass=!pass;
                            });
                          },icon: Icon(pass?
                          Icons.visibility_off: Icons.visibility),color: Colors.white),
                        labelText: "Password",labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0,style: BorderStyle.none)),)
                  ),
                   SizedBox(height: 25,),
                  signinSignup(context, false, (){
                   if (formkey.currentState!.validate()){
                     formkey.currentState?.save();
                     FocusScope.of(context).unfocus();
                     Authcontroller.instance.register( _email.text,  _password.text);
                     Navigator.push(context, MaterialPageRoute(builder:(context)=> homescreen()));
                     Map<String,dynamic> data={"Username":_username.text,"Email":_email.text};
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
                     FirebaseFirestore.instance.collection("Users").add(data);
                     showerr(QuickAlertType.success);
                    }}),
                ],
              )),),
            ),)],
            ),),)
    );
  }
}
