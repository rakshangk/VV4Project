import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vv4/Utils/FormValidation.dart';


class SignUp extends StatefulWidget {
  SignUpLayout createState() => new SignUpLayout();
}

class SignUpLayout extends State<SignUp> {
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();
  FormValadation oFormValadation = new FormValadation();
  bool bAutoValidate = false;
  var varEmail = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    final labelMessage = Text(
      'VV4',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final textboxMobile = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: varEmail,
      maxLines: 1,
      keyboardAppearance: Brightness.dark,
      autofocus: false,
      decoration: InputDecoration(
	      hintText: 'Email Id',
        fillColor: Colors.white,
        labelText: 'Email Id',
        contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
      validator: (value) {
        String strValidationMessage;
        if (value.isNotEmpty)
	        strValidationMessage = oFormValadation.emailNotMatched(value);
        else
	        strValidationMessage = "please enter User Mail-Id/Username ";
        return strValidationMessage;
      },
    );
    final buttonSignUp = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blueGrey,
          child: Text('Sign Up', style: TextStyle(color: Colors.white)),
          onPressed: () {
            if (frmKey.currentState.validate()) {}
          },
        ),
      ),
    );

    final buttonCameraAccess = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blueGrey,
          child: Text('Capture Image', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pushNamed('Layouts/ShoutForFood');
          },
        ),
      ),
    );

    final buttonHaveAccount = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        elevation: 0.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          child: Text('Already have an account?',
              style: TextStyle(color: Colors.red)),
          onPressed: () {
            Navigator.of(context).pushNamed('Layouts/SignInLayout');
          },
        ),
      ),
    );

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            alignment: Alignment.bottomCenter,
            image: new AssetImage("assets/login_bg.jpeg"),
            fit: BoxFit.contain,
          ),
        ),
        child: Form(
          autovalidate: bAutoValidate,
          key: frmKey,
          child: ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 80.0),
              labelMessage,
              SizedBox(height: 30.0),
              textboxMobile,
              SizedBox(height: 8.0),
              buttonSignUp,
              SizedBox(height: 8.0),
              buttonCameraAccess,
              SizedBox(height: 8.0),
              buttonHaveAccount,
              SizedBox(height: 24.0),
              //changePasswordLabel,
            ],
          ),
        ), /* add child content content here */
      ),
    );
  }
}
