import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap/src/bloc/LoginRegistrationBloc.dart';
import 'file:///D:/SrouceTree_clone/AppTaxi_Flutter/lib/src/resource/Page/LoginPage.dart';
import 'package:flutter_ap/src/resource/dialog/LoadingDialog.dart';
import 'package:flutter_ap/src/resource/dialog/MessengerDialog.dart';

import 'MapHomePage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPage createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  LoginRegistrationBloc _registrationBloc = new LoginRegistrationBloc();

  TextEditingController _tecName = new TextEditingController();
  TextEditingController _tecPhone = new TextEditingController();
  TextEditingController _tecPass = new TextEditingController();
  TextEditingController _tecEmail = new TextEditingController();

  bool _showPass = false;
  @override
  void dispose() {
    _registrationBloc.disposeRegistration();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff3277d8)),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/ic_love.png',
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Welcome Aboard\nSign up with ICab im simple stops",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: StreamBuilder(
                      stream: _registrationBloc.nameS,
                      builder: (context, snapshot) => TextField(
                        controller: _tecName,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            labelText: "Name",
                            prefixIcon: Container(
                              width: 5,
                              child:
                                  Image.asset('assets/ic_name_black_24dp.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: StreamBuilder(
                      stream: _registrationBloc.phoneS,
                      builder: (context, snapShot) => TextField(
                        controller: _tecPhone,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            errorText:
                                snapShot.hasError ? snapShot.error : null,
                            labelText: "Phone Number",
                            prefixIcon: Container(
                              width: 5,
                              child:
                                  Image.asset('assets/ic_phone_black_24dp.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: StreamBuilder(
                      stream: _registrationBloc.emailS,
                      builder: (context, snapshot) => TextField(
                        controller: _tecEmail,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            labelText: "Email",
                            prefixIcon: Container(
                              width: 5,
                              child: Image.asset('assets/ic_email.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      StreamBuilder(
                        stream: _registrationBloc.passS,
                        builder: (context, snapshot) => TextField(
                          obscureText: !_showPass,
                          controller: _tecPass,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            labelText: "PassWord",
                            prefixIcon: Container(
                              width: 5,
                              child: Image.asset('assets/ic_password.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: GestureDetector(
                            onTap: _onTapShowPass,
                            child: Text(
                              _showPass ? "Hide" : "Show",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RaisedButton(
                      onPressed: _onClickSignUp,
                      color: Colors.blue,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "Already a User?",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                            text: "Login now",
                            style: TextStyle(
                                color: Color(0xff3277d8), fontSize: 18))
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onClickSignUp() {
    var _isValid = _registrationBloc.isValid(
        _tecName.text, _tecPhone.text, _tecEmail.text, _tecPass.text);
    if (_isValid) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
      LoadingDialog.showLoadingDialog(context, "Loading...");
      _registrationBloc.signUp(
          _tecName.text, _tecEmail.text, _tecPhone.text, _tecPass.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapHomePage()));
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MessengerDialog.showMessengerDialog(context, "Sign-In", msg);
      });
    }
  }

  _onTapShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
