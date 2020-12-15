import 'dart:async';
import 'package:flutter_ap/src/firebase/AuthFireBase.dart';
import 'package:flutter_ap/src/validators/LoginValidator.dart';

class LoginBloc{

  AuthFireBase _authFireBase = AuthFireBase();
  StreamController _emailController = StreamController();
  StreamController _passController = StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;


  signIn(String email, String pass, Function onSuccess, Function(String) onLoginError){
    _authFireBase.signIn(email, pass, onSuccess, onLoginError);
  }

  dispose(){
    _emailController.close();
    _passController.close();
  }
}