import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:login_app/model/user.dart';
import 'package:login_app/screens/Login_screen.dart';

class Register_screen extends StatefulWidget {
  static const routeName = "/registerScreen";

  @override
  State<Register_screen> createState() => _Register_screenState();
}

class _Register_screenState extends State<Register_screen> {
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController cEmailController = TextEditingController();
  TextEditingController cUsernameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    controller: cEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email Id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter email Id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  TextFormField(
                    controller: cUsernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your User Id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter User Id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  TextFormField(
                    obscureText: true,

                    controller: cPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Create your password ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Create password ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty ) {
                        return "Please re-enter your password ";
                      }else if(cPasswordController.text!=value){
                        return "Password is not mathed";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Re-enter password ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          minimumSize: Size(200, 50)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                         user u=user(cUsernameController.text, cEmailController.text, cPasswordController.text);
                         allUsers.add(u);
                         showtoast("Successfully registred",Colors.green, context);
                         Navigator.pop(context);
                        }
                      },
                      child: Text("Register"))
                ],
              ),
            ),
          )),
    );
  }
}
