import 'package:flutter/material.dart';

class DynamicWidgets{
  void showAlertDialog(BuildContext cxt,String strAlertTitle,String strMessage) {
     showDialog(
        context: cxt,
        builder: (_) => new AlertDialog(
            title: new Text(strAlertTitle),
            content: new Text(strMessage),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'), onPressed: () {
                  Navigator.of(cxt).pop();
                }, 
              )
            ],
        )
    );
  }
}