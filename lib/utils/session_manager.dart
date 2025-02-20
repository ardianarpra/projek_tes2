// ignore_for_file: avoid_print
import 'package:flutter/rendering.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SessionManager {
  static String? token;
  final String name = "";

   Future<void> setSession(userItem) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String encodedMap = json.encode(userItem);
    // prefs.setString("userItem", encodedMap);
  }

  Future<String> getIdFromSession() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id;
    // String? encodedMap = prefs.getString('userItem');
    // if (encodedMap != null) {
    //   // UserItem decodeMap = UserItem.fromJson(jsonDecode(encodedMap));
    //   // id = decodeMap.id;
    // } else {
    //   id = "";
    // }
    return id ?? "";
  }

  Future<void> removeSessionShortcut() async {
    // var preferences = await SharedPreferences.getInstance();
    // await preferences.remove('komplainShortcut');
    // await preferences.remove('invoiceShortcut');
  }

  Future<void> destroyAuthToken() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
  }

  Future<String> getAuthToken() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name;
    // name = prefs.getString("name");
    return name ?? "";
  }
}
