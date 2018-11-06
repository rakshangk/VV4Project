import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:camera/camera.dart';
import 'package:vv4/Utils/FormValidation.dart';
import 'package:vv4/main.dart';

class SpotHungerPreview extends StatefulWidget {
  String imagePath;
  SpotHungerPreview({this.imagePath});
  @override
  SpotHungerPreviewState createState() => new SpotHungerPreviewState();
}

List<CameraDescription> cameras;

class SpotHungerPreviewState extends State<SpotHungerPreview> {
  
  bool bAutoValidate = false;
  var varNoOfHungers = new TextEditingController();
  FormValidation oFormValadation = new FormValidation();
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();
  var strNoOFHungers = new TextEditingController();

  //Location
  Map<String, double> m_startLocation;
  Map<String, double> m_currentLocation;
  StreamSubscription<Map<String, double>> m_locationSubscription;
  bool m_bPermission = false;
  String m_strError;
  bool m_bcurrentWidget = true;
  Location m_oLocation = new Location();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    m_locationSubscription =
        m_oLocation.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        m_currentLocation = result;
      });
    });
  }

  initPlatformState() async {
    Map<String, double> location;
    try {
      m_bPermission = await m_oLocation.hasPermission();
      location = await m_oLocation.getLocation();
      m_strError = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        m_strError = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        m_strError =
            'Permission denied - please ask the user to enable it from the app settings';
      }
      location = null;
    }
    setState(() {
      m_startLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
	  final topAppBar = AppBar(
		  elevation: 0.1,
		  backgroundColor: Color.fromRGBO(64, 75, 96, .9),
		  title: Text('Spot Hunger Preview'),
		  actions: <Widget>[
			  IconButton(
				  icon: Icon(Icons.list),
				  onPressed: () {},
			  )
		  ],
	  );

    final noHungers = new Padding(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: varNoOfHungers,
        maxLines: 1,
        keyboardAppearance: Brightness.dark,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'No Of Hunger People',
          fillColor: Colors.white,
          labelText: 'No Of Hunger People',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          String strValidationMessage;
          if (value.isNotEmpty) {
          } else
            strValidationMessage = "please enter no of Hunger People ";
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
          minWidth: 200.0,
          height: 60.0,
          color: Color.fromRGBO(64, 75, 96, .9),
          child: Text('Shout for Food', style: TextStyle(color: Colors.white)),
          onPressed: () {
            if (frmKey.currentState.validate()) {
            	File imageFile=File(widget.imagePath.toString());
            	String strLatitude=m_currentLocation['latitude'].toString();
            	String strLongitude=m_currentLocation['longitude'].toString();
            	String strGeoLocation="'"+strLatitude+"&"+strLongitude+"'";
            	String strHungersCount=varNoOfHungers.text;
              MyApp.m_oDataSource_main.spottedHunger(
                  context, strGeoLocation,strHungersCount,imageFile);
            }
          },
        ),
      ),
    );

    return new Scaffold(
      key: scaffoldKey,
      appBar: topAppBar,
      resizeToAvoidBottomPadding: true,
      body: new Container(
        child: Form(
          autovalidate: bAutoValidate,
          key: frmKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                child: Image.file(File(widget.imagePath.toString())),
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
}
