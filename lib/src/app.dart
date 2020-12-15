import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ap/src/resource/HomePage.dart';
import 'package:flutter_ap/src/resource/LoginPage.dart';
import 'package:flutter_ap/src/resource/RegistrationPage.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}