import 'package:flutter/material.dart';

class LoginValidator {
  static bool isValidUser(String email){
    return email.isNotEmpty && email.length>6 && email.contains("@");
  }
  static bool isValidPass(String pass){
    return pass.isNotEmpty && pass.length > 6;
  }
}
