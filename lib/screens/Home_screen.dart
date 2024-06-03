


import 'package:flutter/material.dart';
import 'package:login_app/functions.dart';
import 'package:login_app/screens/Login_screen.dart';

class Home_screen extends StatelessWidget {
  static const routeName="/homeScreen";
 
  

  @override
  Widget build(BuildContext context) {
     final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String, String>;
     final userName =routeArgs["username"];
     final password =routeArgs["password"];
    return  Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("Home Screen"),
        automaticallyImplyLeading: false
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Center(child: Text("Hello $userName", style: TextStyle(fontSize: 24),)),
        ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        minimumSize: Size(200, 50)
        ),
          onPressed: ()async{
           bool result=await clearUserDetails();
           if(result){
            Navigator.popAndPushNamed(context, Login_screen.routeName);
            showtoast("Log Out sucessfully", Colors.green, context);
           }else{
            showtoast("Failed to Log Out ", Colors.green, context);

           }
            
         
        }, child:Text("Log Out"))
      ],),
    );
  }
}