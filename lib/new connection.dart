import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/quickalert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class newconnection extends StatefulWidget {
  const newconnection( {Key? key}) : super(key: key);

  @override
  State<newconnection> createState() => _newconnectionState();
}

class _newconnectionState extends State<newconnection> {
  void showerr(QuickAlertType quick){
    QuickAlert.show(
        context: context,
        text: 'Welcome to cable network',
        type:  quick);
  }


  GlobalKey<FormState> formkey= GlobalKey<FormState>();
  var name =new TextEditingController();
  var phone =new TextEditingController();
  var address=new TextEditingController();
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
              child: Form(
                key: formkey,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Text('Welcome To Digital Cable Payments!', style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold, color: Colors.white,),
                      ),
                      SizedBox(height: 25,),
                      TextFormField (
                          controller: name,
                          validator: (name){
                            if (name==null || name.isEmpty ){
                              return "Enter your name";
                            }else if (name.length <3){
                              return "enter valid name";
                            }
                            return null;
                          },style: TextStyle(color: Colors.white.withOpacity(0.9)),
                          decoration: InputDecoration(prefixIcon: Icon(Icons.person,color: Colors.white70,),
                              labelText: "Name",labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(width: 0,style: BorderStyle.none)))
                      ),
                      SizedBox(height: 25,),
                      TextFormField (
                          controller: phone,
                          validator: (phone){
                            if (phone==null || phone.isEmpty){
                              return "Enter your phone number";
                            }else if (phone.length <10 || phone.length >11){
                              return "Enter valid phone number";
                            }
                            return null;
                          },style: TextStyle(color: Colors.white.withOpacity(0.9)),keyboardType: TextInputType.phone,
                          decoration: InputDecoration(prefixIcon: Icon(Icons.mobile_friendly,color: Colors.white70,),
                              labelText: "Phone Number",labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(width: 0,style: BorderStyle.none)))
                      ),
                      SizedBox(height: 25,),
                      TextFormField (
                          controller: address,
                          validator: (value){
                            if (value==null || value.isEmpty){
                              return "Enter your  address";
                            }
                            return null;
                          },style: TextStyle(color: Colors.white.withOpacity(0.9)),keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(prefixIcon: Icon(Icons.location_on,color: Colors.white70,),
                              labelText: "Address",labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(width: 0,style: BorderStyle.none)))
                      ),
                  Container(
                    width: 310,height: 50,margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150)
                  ),child: TextButton(onPressed: (){
                    if (formkey.currentState!.validate()){
                      formkey.currentState?.save();
                      FocusScope.of(context).unfocus();
                      Map<String,dynamic> data={"Name":name.text,"Phone number":phone.text,"Address":address.text};
                      FirebaseFirestore.instance.collection("NewConnection").add(data);
                      showerr(QuickAlertType.success);
                    }
                  }, child: Text( 'Submit' ,style: TextStyle(color: Colors.black87,
                      fontWeight: FontWeight.bold,fontSize: 18),),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
                      if(states.contains(MaterialState.pressed)){
                        return Colors.black26;
                      }
                      return Colors.white;
                    }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
                    ),),
                  )

                    ]
              ),
        )
    )))])),)
    );}
}
