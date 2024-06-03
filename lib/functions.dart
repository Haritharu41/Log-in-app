import 'dart:async';

import 'package:login_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveUserDetails(user u) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // Save an String value to 'action' key.
  await prefs.setString('Username', u.name);
  await prefs.setString('Email', u.email);
  await prefs.setBool('IsLoggedIn', true);
}

readUserDetails() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? Username = prefs.getString('Username');
  final String? Email = prefs.getString('Email');
  final bool? isLoggedIn = prefs.getBool('IsLoggedIn');
  return [Username, Email, isLoggedIn];
}

Future<bool> clearUserDetails() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // clear an String value to 'action' key.
    await prefs.setString('Username', "");
    await prefs.setString('Email', "");
    await prefs.setBool('IsLoggedIn', false);
    return true;
  } catch (e) {
    return false;
  }

}
