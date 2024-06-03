import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:login_app/functions.dart';
import 'package:login_app/model/user.dart';
import 'package:login_app/screens/Home_screen.dart';
import 'package:login_app/screens/Register_screen.dart';

class Login_screen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController cUsername = TextEditingController();

  TextEditingController cPassword = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getDetails();

    super.initState();
  }

  void getDetails() async {
    var users = await readUserDetails();
    if (users[2] == true) {
      Navigator.pushReplacementNamed(context, Home_screen.routeName,
          arguments: {"username": users[0].toString(),
           "password": ""});
    }
  }

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
                      suffixIcon: Icon(Icons.visibility)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (allUsers.isEmpty) {
                      showtoast("No user found, Creat account first",Colors.red, context);
                      return;
                    }

                    if (cUsername.text.isNotEmpty &&
                        cPassword.text.isNotEmpty) {
                      allUsers.forEach((users) {
                        String username = users.name;
                        String password = users.password;
                        if (cUsername.text == username &&
                            cPassword.text == password) {
                          Navigator.popAndPushNamed(
                              context, Home_screen.routeName, arguments: {
                            "username": cUsername.text,
                            "password": cPassword.text
                          });
                          //TODO: Write save code.
                          saveUserDetails(users);
                        } else {
                          showtoast("Invalid username or password", Colors.red, context);
                        }
                      });
                    } else {
                      showtoast("Please enter username and password", Colors.red, context);
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
                  onPressed: () {
                    Navigator.pushNamed(context, Register_screen.routeName);
                  },
                  child: Text("Create new account"))
            ],
          ),
        ),
      ),
    );
  }
}

showtoast(String msg, Color color ,BuildContext context) {
  showToast(msg,
      context: context,
      isHideKeyboard: true,
      backgroundColor: color,
      axis: Axis.horizontal,
      alignment: Alignment.center,
      position: StyledToastPosition.bottom);
}
