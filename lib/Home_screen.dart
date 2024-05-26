

import 'package:flutter/material.dart';

class Home_screen extends StatelessWidget {
  static const routeName="/homeScreen";
 
  

  @override
  Widget build(BuildContext context) {
     final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String, String>;
     final userName =routeArgs["username"];
     final password =routeArgs["password"];
    return  Scaffold(
      appBar:AppBar(
        title: Text("Home Screen"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Center(child: Text("Hello $userName", style: TextStyle(fontSize: 24),))
      ],),
    );
  }
}