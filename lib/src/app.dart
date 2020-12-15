import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap/src/bloc/LoginRegistrationBloc.dart';

class MyApp extends InheritedWidget {
  final LoginRegistrationBloc mLoginRegistrationBloc;
  final Widget child;

  MyApp(this.mLoginRegistrationBloc, this.child) : super(child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static MyApp of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyApp);
  }
}
