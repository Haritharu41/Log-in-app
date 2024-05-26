import 'package:flutter/material.dart';
import 'package:login_app/Home_screen.dart';
import 'package:login_app/Login_screen.dart';
import 'package:login_app/Register_screen.dart';
void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Login_screen.routeName,
      routes: {
        Home_screen.routeName: (context)=>Home_screen(),
        Login_screen.routeName: (context)=>Login_screen(),
        Register_screen.routeName:(context)=>Register_screen(),


      },
      title: "Login_app",
      home:Home() ,
    );
  }
}
class Home  extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(

      )
    
    );
  }
}