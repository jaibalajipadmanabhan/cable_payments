import 'package:cable_payments/complaint.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cable_payments/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cable_payments/new connection.dart';
import 'package:cable_payments/recharge.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);


  @override
  State<homescreen> createState() => _homescreenState();
}
final auth=FirebaseAuth.instance;

class _homescreenState extends State<homescreen> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Digital Cabel"),centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [IconButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return Container(
            child: AlertDialog(
              title: Text("Are you sure you want to logout?"),actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("No")),
              TextButton(onPressed: (){
                auth.signOut().then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));
                });
                Navigator.pop(context);
              }, child: Text("Yes")),
            ],
            ),
          );
        });
      }, icon: Icon(Icons.logout))],),

      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFba16ba),Color(0xFF873987),Color(0xFF26507a)],begin: Alignment.topCenter
          ,end: Alignment.bottomCenter)),
            child: SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      height: 104,margin: EdgeInsets.only(bottom: 30),child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        CircleAvatar(radius:45,
                          backgroundImage: NetworkImage('https://media.istockphoto.com/id/173561512/photo/satellite-dish.jpg?s=612x612&w=0&k=20&c=y393oiA-Tw-rHrCT1LI6XxUSCtUIgGh3S2ivCyV81Uc='),
                        ),SizedBox(width: 25,),Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Online Cable ',style: TextStyle(color: Colors.white,fontSize: 20),)
                          ,Text('Payments',style: TextStyle(color: Colors.white,fontSize: 20),)],)
                    ],),
                    ),
                    Expanded(
                      child: GridView.count(mainAxisSpacing: 10,crossAxisSpacing: 10,primary: false,crossAxisCount: 2,
                          children: [
                            InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>newconnection()));
                                  },
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.network('https://img.icons8.com/dotty/1x/hdmi-cable.svg',height: 70,
                                    ),Text("New connection",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromRGBO(63, 63, 63, 1)),)
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>complaint()));
                                  },
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.network('https://img.icons8.com/fluency/1x/complaint.svg',height: 70,
                                    ),Text("Complaint",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromRGBO(63, 63, 63, 1)),)
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>rechareg()));
                                  },
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.network('https://img.icons8.com/color/1x/mobile-payment.svg',height: 70,
                                    ),Text("Recharge",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromRGBO(63, 63, 63, 1)),)
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network('https://img.icons8.com/ios/1x/willingness-to-learn.svg',height: 70,
                                  ),Text("More to know",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color.fromRGBO(63, 63, 63, 1)),)
                                ],
                              ),
                            )
                          ],
                    )
                    ),],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

