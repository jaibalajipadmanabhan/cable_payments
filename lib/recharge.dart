import 'package:flutter/material.dart';
import 'package:cashfree_pg/cashfree_pg.dart';
class rechareg extends StatefulWidget {
  const rechareg({Key? key}) : super(key: key);

  @override
  State<rechareg> createState() => _recharegState();
}class _recharegState extends State<rechareg> {

  var response = "";
  var didreceiveResponse = false;

  responseReceived() {
    setState(() {
      this.didreceiveResponse = true;
    });
  }

  buttonTap() {
    Map<String, String>pharm = {
      "orderId": "10",
      "orderAmount": "250",
      "appId" : "323348a5d9811e5cac7923038c843323",
      "orderCurrency": "INR",
      "customerName": "Ramesh",
      "customerPhone": "9042353994",
      "customerEmail": "Ramesh@gmail.com",
      "stage": "TEST",
      "tokenData": "lL9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.hB9JCMyY2Y3ImZyYWYmNjNiojI0xWYz9lIscDO1IDO5kzN2EjOiAHelJCLiIlTJJiOik3YuVmcyV3QyVGZy9mIsICM1IjI6ICduV3btFkclRmcvJCLiATMiojIklkclRmcvJye.fLH57xLZOHSTJ0jblswgaBKTrzFH_tGyhSjq7IXh7eWYTD37QdseBoJDWqEkUiYv1m"
    ,
    "orderNote":"this is an optional",
    };
    pharm[ "paymentOption"] = "wallet";
    pharm[ "paymentCode"] = "4004";
    pharm[ "paymentOption"] = "paypal";
    pharm[ "paymentOption"] = "NB";
    pharm[ "paymentCode"] = "3003"; // Put correct bank code here
    CashfreePGSDK.doPayment(pharm).then((value) =>
        value?.forEach((key, value) {
          this.responseReceived();
          print("$key : $value");
          response += "\"$key\":\"$value\"\n";
          //Do something with the result
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          buttonTap();
        }, child: Text("Click")),
      ),
    );
  }
}
