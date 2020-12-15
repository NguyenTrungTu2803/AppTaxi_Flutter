import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ap/src/app.dart';
import 'package:flutter_ap/src/resource/RegistrationPage.dart';
import 'package:flutter_ap/src/resource/dialog/MessengerDialog.dart';
import 'HomePage.dart';
import 'dialog/LoadingDialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passEditingController = TextEditingController();

  bool _showPass = false;

  get _mLogin => MyApp.of(context).mLoginRegistrationBloc;
  @override
  void dispose() {
    _mLogin.disposeLogin();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white));
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Welcome back!\nLogin to continue using ICab",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: StreamBuilder(
                    stream: _mLogin.emailS,
                    builder: (context, snapShot)=> TextField(
                        controller: _emailEditingController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          errorText: snapShot.hasError ? snapShot.error : "",
                          labelText: "Email",
                          prefixIcon: Container(
                            width: 5,
                            child: Image.asset('assets/ic_email.png'),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                        )),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: StreamBuilder(
                    stream: _mLogin.passS,
                    builder: (context, snapShot)=> TextField(
                        obscureText: true,
                        controller: _passEditingController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          errorText: snapShot.hasError ? snapShot.error : "",
                          labelText: "PassWord",
                          prefixIcon: Container(
                            width: 5,
                            child: Image.asset('assets/ic_password.png'),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                        )),
                  )
                ),
                Container(
                    width: double.infinity,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Forgot PassWord?",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: _onClickSignIn,
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: RichText(
                    text: TextSpan(
                      text: "New User?",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage()));
                              },
                            text: "Sign up for a new account",
                            style: TextStyle(
                                color: Color(0xff3277d8), fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onClickSignIn() {
    String _email = _emailEditingController.text;
    String _pass = _passEditingController.text;
    setState(() {
      if(_mLogin.isValidLogin(_email, _pass)){
        LoadingDialog.showLoadingDialog(context, "Loading...");
        _mLogin.signIn(_email, _pass, (){
          LoadingDialog.hideLoadingDialog(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }, (msg){
          LoadingDialog.hideLoadingDialog(context);
          MessengerDialog.showMessengerDialog(context, "Sign-In", msg);
        });
      }
    });
  }

}








