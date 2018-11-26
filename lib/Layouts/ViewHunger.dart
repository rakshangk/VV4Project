import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vv4/Lists/HungersList.dart';
import 'package:vv4/Models/SpottedList.dart';
import 'package:vv4/Utils/Session.dart';
import 'package:vv4/main.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class ViewHunger extends StatefulWidget {
  ViewHungerState createState() => new ViewHungerState();
}

class ViewHungerState extends State<ViewHunger> {
  Session oSession = new Session();
  StreamSubscription<Map<String, double>> m_locationSubscription;

  Map<String, double> m_startLocation;
  Map<String, double> m_currentLocation;
  bool m_bPermission = false;
  String m_strError;
  bool m_bcurrentWidget = true;
  Location m_oLocation = new Location();

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
    } catch (e) {
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
      return new Scaffold(
        appBar: AppBar(
          title: Text(
            'Opportunities to Feed',
            style: TextStyle(
              color: Color.fromRGBO(64, 75, 96, .9),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: FutureBuilder<Lists>(
            future: MyApp.m_oDataSource_main.fetchHungerList(
                m_currentLocation['latitude'].toString(),
                m_currentLocation['longitude'].toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Container(
                  child: Column(
                    children: <Widget>[
                      new Expanded(
                          child: new ListView(
                            padding: new EdgeInsets.symmetric(vertical: 0.0),
                            children: snapshot.data.kLists.map((
                                SpottedList oSpottedList) {
                              return new HungerItemList(oSpottedList);
                            }).toList(),
                          )),
                    ],
                  ),
                );
              }
              else if (snapshot == null || snapshot.hasError) {
                return Text("could not get response");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      );
    }
  }


