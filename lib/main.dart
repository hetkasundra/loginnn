import 'package:flutter/material.dart';
import 'package:loginnn/login.dart';
import 'package:loginnn/register.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' : (context)=>Login(),
      'register' : (context)=>Register(),
    },
  ));
}
