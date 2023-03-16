import 'package:cable_payments/auth_control.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cable_payments/home.dart';
import 'package:cable_payments/reusable.dart';
import 'package:cable_payments/signup.dart';
import 'package:quickalert/quickalert.dart';
class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  void showalert(QuickAlertType quick){
    QuickAlert.show(
        context: context,
        title: 'Login',text: 'login successfully',
        type:  quick);
  }
  void showerr(QuickAlertType quick){
    QuickAlert.show(
        context: context,
        title: 'Login',text: 'Invalid email or password',
        type:  quick);
  }

  GlobalKey<FormState> formkey= GlobalKey<FormState>();
  bool pass=true;
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,title: Text("",style: TextStyle(fontSize: 0,fontWeight: FontWeight.bold),),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: [
            Container(height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFba16ba),
                          Color(0xFF873987),
                          Color(0xFF26507a)
                        ]
                    )
                ),
               child:Form(key: formkey,
                   child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign In', style: TextStyle(fontSize: 40,
                          fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 40,width: 20,),
                      TextFormField (
                        controller: _email,
                          validator: (email) {
                            if (email!.isEmpty)
                              return "enter your email";
                            else
                              return null;
                          },style: TextStyle(color: Colors.white.withOpacity(0.9)),
                          decoration: InputDecoration(prefixIcon: Icon(Icons.email,color: Colors.white70,),
                              labelText: "Email",labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(width: 0,style: BorderStyle.none)))
                      ),
                      SizedBox(height: 30,),
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
                      SizedBox(height: 10,),
                      signinSignup(context, true, () {
    if(formkey.currentState!.validate()){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text).
    catchError((onError){
            showerr(QuickAlertType.warning);
    }).then((authuser){
      if (authuser.user!=null)
        Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
      showalert(QuickAlertType.success);
    }
    );
                      }}),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                          }, child: Text("Sign up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17)))
                        ],
                      )
                    ])))
          ],
          ),),),);
  }

// Expanded signup(){
//   return Expanded(child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text("Dont have an account?",style: TextStyle(color: Colors.white)),
//       GestureDetector(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
//         },child: const Text(" Sign up",style: TextStyle
//         (color: Colors.white,fontWeight: FontWeight.bold),),
//       )
//     ],
//   ),);
// }
//


}