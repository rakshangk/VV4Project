import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DynamicWidgets
{
  void showAlertDialog (BuildContext cxt, String strAlertTitle, String strMessage)
  {
    showDialog (
        context: cxt,
        barrierDismissible: false,
        builder: (_)
        =>
        new AlertDialog(
          title: new Text(strAlertTitle),
          content: new Text(strMessage),
          actions: <Widget>[
            new FlatButton(
              child: new Text('OK'), onPressed: ()
            {
              Navigator.of (cxt).pop ();
            },
            )
          ],
        )
    );
  }

  void showAlertDialogHome (BuildContext cxt, String strAlertTitle, String strMessage)
  {
    showDialog (
        context: cxt,
        barrierDismissible: false,
        builder: (_)
        =>
        new AlertDialog(
          title: new Text(strAlertTitle),
          content: new Text(strMessage),

          actions: <Widget>[
            new FlatButton(
              child: new Text('OK'), onPressed: ()
            {
              Navigator.of (cxt).pushNamed ('Layouts/Home');
            },
            )
          ],
        )
    );
  }

   static void showToastAlert(BuildContext context, String strData)
  {
    Fluttertoast.showToast(
        msg: strData,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        textcolor: '#ffffff'
    );
  }
}
