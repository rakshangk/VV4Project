import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:vv4/Models/SpottedList.dart';

class HungerListDetails extends StatefulWidget {
  final String m_strImagePreview, m_strLatitude, m_strLongitude, m_strHungersCount;

  HungerListDetails({Key key, this.m_strImagePreview, this.m_strLatitude, this.m_strLongitude, this.m_strHungersCount}) : super(key: key);

  HungerListDetailsState createState() {
    return new HungerListDetailsState();
  }
}

class HungerListDetailsState extends State<HungerListDetails> {
  Map<String, double> m_startLocation;
  Map<String, double> m_currentLocation;
  bool m_bPermission = false;
  String m_strError;
  bool m_bcurrentWidget = true;
  Location m_oLocation = new Location();
  StreamSubscription<Map<String, double>> m_locationSubscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    m_locationSubscription = m_oLocation.onLocationChanged().listen((Map<String, double> result) {
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
    } catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        m_strError = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        m_strError = 'Permission denied - please ask the user to enable it from the app settings';
      }
      location = null;
    }
    setState(() {
      m_startLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        'Details',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
    );
    final imagePreview = new Center(
      child: new AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Color.fromRGBO(64, 75, 96, .9),
                width: 10.0,
              ),
              image: new DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: new NetworkImage(widget.m_strImagePreview),
              )),
        ),
      ),
    );

    final imageMap = new Center(
      child: new AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Color.fromRGBO(64, 75, 96, .9),
                width: 10.0,
              ),
              image: new DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: new NetworkImage("https://maps.googleapis.com/maps/api/staticmap?center=${widget.m_strLatitude},${widget.m_strLongitude}&zoom=18&size=640x400&key=YOUR_API_KEY"),
              )),
        ),
      ),
    );
    final strAddress = Text(
      'Address :' + 'M G Road, Bangeluru',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
    final strHungersCount = Text(
      '#${widget.m_strHungersCount} Person(s)',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
    return Scaffold(
        appBar: appbar,
        body: Column(
          children: <Widget>[
            imagePreview,
            imageMap,
            strHungersCount,
            strAddress,
          ],
        ));
  }
}
