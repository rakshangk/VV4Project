import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:camera/camera.dart';
import 'package:vv4/Utils/FormValidation.dart';
import 'package:vv4/main.dart';
import 'package:vv4/Layouts/Home.dart';
import 'package:image/image.dart' as Imagepkg;

class SpotHungerPreview extends StatefulWidget {
  String StrCapturedImageFilePath;
  String StrThumbnailImageFilePath;
  SpotHungerPreview({this.StrCapturedImageFilePath,this.StrThumbnailImageFilePath});
  @override
  SpotHungerPreviewState createState() => new SpotHungerPreviewState();
}

List<CameraDescription> cameras;

class SpotHungerPreviewState extends State<SpotHungerPreview> {
  int _state = 0;
  bool bAutoValidate = false;
  var varNoOfHungers = new TextEditingController();
  FormValidation oFormValadation = new FormValidation();
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();
  var strNoOFHungers = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {


    final noHungers = new Padding(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: varNoOfHungers,
        maxLines: 1,
        keyboardAppearance: Brightness.dark,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'No. Of Hunger People',
          fillColor: Colors.white,
          labelText: 'No. Of Hunger People',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          String strValidationMessage;
          if (value.isNotEmpty) {
          } else
            strValidationMessage = "please enter no. of Hunger People ";
          return strValidationMessage;
        },
      ),
    );

    final buttonShout = Padding(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          child: setUpButtonChild(),
          minWidth: 200.0,
          height: 60.0,
          color: Color.fromRGBO(64, 75, 96, .9),
          elevation: 4.0,
          onPressed: () {
            setState(() {
              if (_state == 0) {
                animateButton();
              }
            });
            if (frmKey.currentState.validate()) {
            	File strImageFile=File(widget.StrCapturedImageFilePath.toString());
            	File strThumbnailFile=File(widget.StrThumbnailImageFilePath.toString());
            	String strLatitude=HomeLayout.m_currentLocation['latitude'].toString();
            	String strLongitude=HomeLayout.m_currentLocation['longitude'].toString();
            	String strHungersCount=varNoOfHungers.text;
              MyApp.m_oDataSource_main.spottedHunger(
                  context, strLatitude,strLongitude,strHungersCount,strImageFile,strThumbnailFile);
            }
          },
        ),
      ),
    );

    return new Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: true,
      body: new Container(
        child: Form(
          autovalidate: bAutoValidate,
          key: frmKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                child: Image.file(File(widget.StrCapturedImageFilePath.toString())),
                width: 300.0,
              ),
              SizedBox(height: 8.0),
              noHungers,
              SizedBox(height: 8.0),
              buttonShout,
              SizedBox(height: 24.0),
            ],
          ),
        ), /* add child content content here */
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Shout for Food",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    }
     else {
      //return Icon(Icons.check, color: Colors.white);
      return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
    }
  }

    void animateButton() {
    setState(() {
    _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
    setState(() {
    _state = 2;
    });
    });
    }
}
