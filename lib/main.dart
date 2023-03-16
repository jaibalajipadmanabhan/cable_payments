import 'package:cable_payments/home.dart';
import 'package:cable_payments/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_control.dart';
import 'package:get/get.dart';
import 'recharge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(Authcontroller()));

  runApp(InitialScreen());
}
class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: loginscreen(),
      ),
    );
  }
}

//cashfree_pg: 2.0.12+32
// class recharge extends StatefulWidget {
//   const recharge({Key? key}) : super(key: key);
//
//   @override
//   State<recharge> createState() => _rechargeState();
// }


// class _rechargeState extends State<recharge> {
//   TextEditingController cont=TextEditingController();
//   @override
//   Razorpay _razorpay= Razorpay();
//   void initState() {
//     _razorpay=Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextField(
//               controller: cont,decoration: InputDecoration(border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),borderSide: BorderSide(width: 5,color: Colors.cyanAccent)
//             )),
//             ),
//             TextButton(onPressed: (){
//               opencheck();
//             }, child: Text("Pay now!"))
//           ],
//         ),
//       ),
//     );
//   }
//   void opencheck() async{
//     var options = {
//       'key': '<YOUR_KEY_HERE>',
//       'amount': cont.text,
//       'name': 'Acme Corp.',
//       'description': 'Cable payment',
//       'prefill': {
//         'contact': '',
//         'email': ''
//       }
//     };
//     try{
//       _razorpay.open(options);
//     }catch(e){
//       debugPrint(e as String?);
//     }
//   }
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     // Do something when payment succeeds
//     Fluttertoast.showToast(msg: "Success:  ${response.paymentId}",timeInSecForIosWeb:4  );
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Do something when payment fails
//     Fluttertoast.showToast(msg: "Error: ${ response.code.toString()+"-"}",timeInSecForIosWeb: 4);
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Do something when an external wallet was selected
//     Fluttertoast.showToast(msg: "External wallet: ${response.walletName}",timeInSecForIosWeb: 4);
//   }
// }
//
