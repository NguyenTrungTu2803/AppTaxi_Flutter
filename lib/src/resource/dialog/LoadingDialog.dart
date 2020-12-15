import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => new Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
              child: Container(
                child: SingleChildScrollView(
                 child: Center(
                   child: Column(
                     children: <Widget>[
                       CircularProgressIndicator(backgroundColor: Colors.blue,),
                       Text(
                         msg,
                         style: TextStyle(fontSize: 18, color: Colors.blue),
                       ),
                     ],
                   ),
                 ),

                ),
              ),
            ));
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(LoadingDialog);
  }
}
