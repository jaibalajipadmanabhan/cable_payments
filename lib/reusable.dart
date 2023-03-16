import 'package:flutter/material.dart';


TextField reusableTextField(String text,IconData icon,bool isPasswordType,TextEditingController controller){
  return TextField(controller: controller,obscureText: isPasswordType,enableSuggestions: !isPasswordType,
  autocorrect: !isPasswordType,cursorColor: Colors.white,style: TextStyle(color: Colors.white.withOpacity(0.9)),

  decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.white70,),
  labelText: text,labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),filled: true,floatingLabelBehavior: FloatingLabelBehavior.never,
  fillColor: Colors.white.withOpacity(0.3),border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(width: 10,style: BorderStyle.none)),
  ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container signinSignup(
BuildContext context,bool islogin,Function onTap){
  return Container(
    width: 310,height: 50,margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(150)
  ),child: TextButton(onPressed: (){onTap();}, child: Text(islogin ? 'Login' : 'Signup' ,style: TextStyle(color: Colors.black87,
  fontWeight: FontWeight.bold,fontSize: 18),),
  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
    if(states.contains(MaterialState.pressed)){
      return Colors.black26;
    }
    return Colors.white;
  }),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
  ),),
  );
}

Container newconnection(
    BuildContext context, Function onTap){
  return Container(
    width: 310,height: 50,margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(150)
  ),child: TextButton(onPressed: (){onTap();}, child: Text( 'Submit' ,style: TextStyle(color: Colors.black87,
      fontWeight: FontWeight.bold,fontSize: 18),),
    style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.pressed)){
        return Colors.black26;
      }
      return Colors.white;
    }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
    ),),
  );
}