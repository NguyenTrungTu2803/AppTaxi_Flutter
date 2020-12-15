import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ap/src/validators/LoginValidator.dart';
class LoginBloc{
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String user, String pass){
    if(!LoginValidator.isValidUser(user)){
      _userController.sink.addError("UserName Failed");
      return false;
    }
    _userController.add("Ok");
    if(!LoginValidator.isValidPass(pass)){
      _passController.sink.addError("PassWord Failed");
      return false;
    }
    _passController.add("Ok");
    return true;
  }
  void dispose(){
    _userController.close();
    _passController.close();
  }
}