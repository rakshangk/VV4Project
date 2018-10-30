import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignInLayout createState() => new SignInLayout();
}

class SignInLayout extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final labelMessage = Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final textboxMobile = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Mobile Number/Email ID',
        fillColor: Colors.white,
        labelText: 'Mobile Number/Email ID',
        contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
      validator: (value) {
        String strValidationMessage;
        return strValidationMessage;
      },
    );
    final textboxPassword = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Password',
        fillColor: Colors.white,
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
      validator: (value) {
        String strValidationMessage;
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
          child: Text('Sign In', style: TextStyle(color: Colors.white)),
          onPressed: () {
            // Navigator.of(context).pushNamed(HomePage.tag);
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
          child: Text("Don't have an Account? / Forgot Password?",
              style: TextStyle(color: Colors.red)),
          onPressed: () {
            Navigator.of(context).pushNamed('Layouts/SignUpLayout');
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
            fit: BoxFit.scaleDown
          ),
        ),
        child: Form(
          child: ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 80.0),
              labelMessage,
              SizedBox(height: 30.0),
              textboxMobile,
              SizedBox(height: 8.0),
              textboxPassword,
              SizedBox(height: 8.0),
              buttonSignUp,
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
