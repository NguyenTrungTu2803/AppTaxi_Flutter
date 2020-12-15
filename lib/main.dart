import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap/src/app.dart';
import 'package:flutter_ap/src/bloc/LoginRegistrationBloc.dart';
import 'package:flutter_ap/src/resource/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
      LoginRegistrationBloc(),

      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      )));
}
