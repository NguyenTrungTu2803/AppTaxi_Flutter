import 'dart:async';
import 'package:flutter_ap/src/firebase/AuthFireBase.dart';
import 'package:flutter_ap/src/validators/RegistrationValidator.dart';

class RegistrationBloc {
  AuthFireBase authFireBase = new AuthFireBase();
  StreamController _nameSC = new StreamController();
  StreamController _phoneSC = new StreamController();
  StreamController _emailSC = new StreamController();
  StreamController _passSC = new StreamController();

  Stream get nameS => _nameSC.stream;
  Stream get phoneS => _phoneSC.stream;
  Stream get emailS => _emailSC.stream;
  Stream get passS => _passSC.stream;

  bool isValid(String name, String phone, String email, String pass) {
    if (!RegistrationValidator.isValidName(name)) {
      _nameSC.sink.addError("Tên không để trống");
      return false;
    }
    _nameSC.sink.add("");
    if (!RegistrationValidator.isValidPhone(phone)) {
      _phoneSC.sink.addError("Số điện thoại không để trống");
      return false;
    }
    _phoneSC.sink.add("OK");
    if (!RegistrationValidator.isValidEmail(email)) {
      _emailSC.sink.addError("Email không để trống");
      return false;
    }
    _emailSC.sink.add("OK");
    if (!RegistrationValidator.isValidPass(pass)) {
      _passSC.sink.addError("Mật khẩu không để trống");
      return false;
    }
    _passSC.sink.add("OK");
    return true;
  }

  void signUp(String name, String email, String phone, String pass,
      Function onSuccess, Function(String) onRegisterError) {
    authFireBase.signUp(name, email, pass, phone, onSuccess, onRegisterError);
  }

  void dispose() {
    _nameSC.close();
    _emailSC.close();
    _phoneSC.close();
    _passSC.close();
  }
}
