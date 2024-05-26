


import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_app/Home_screen.dart';

class Login_screen extends StatelessWidget {
  TextEditingController cUsername=TextEditingController();
  TextEditingController cPassword=TextEditingController();
  String username= "Admin";
  String password="hari123";
  
  

  static const routeName = "/loginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Log in",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: cUsername,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.green)),
                      hintText: "Enter Username",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: cPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.green)),
                      hintText: "Enter Passsword",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon (Icons.visibility)
                      
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if(cUsername.text.isNotEmpty && cPassword.text.isNotEmpty){
                      if(cUsername.text==username && cPassword.text==password){
                     Navigator.pushNamed(context, Home_screen.routeName,
                     arguments: {"username":cUsername.text, "password":cPassword.text}
                     );
                      } else{
                     showtoast("Invalid username or password", context);
                    }} else{
                      showtoast("Please enter username and password", context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                  icon: Icon(Icons.login),
                  label: Text("Log In"),
                ),
              ),
              TextButton(onPressed: () {}, child: Text("Foget Password?")),
              Divider(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     minimumSize: Size(200, 50),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: Text("Create new account"))
            ],
          ),
        ),
      ),
    );
  }
}


showtoast(String msg, BuildContext context){
     showToast(msg,
     context:context,
                    isHideKeyboard: true,
                    backgroundColor: Colors.red,
                    axis: Axis.horizontal,
                    alignment: Alignment.center,
                    position: StyledToastPosition.bottom);
                    

                    }