import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vv4/Layouts/DashBoard.dart';
import 'package:vv4/Layouts/SignInLayout.dart';
import 'package:vv4/Layouts/SpotHunger.dart';
import 'package:vv4/Layouts/ViewHunger.dart';
import 'package:vv4/Lists/HungersList.dart';
import 'package:vv4/Models/SpottedList.dart';
import 'package:vv4/main.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:vv4/Layouts/Home.dart';
import 'package:vv4/Widgets/DynamicWidgets.dart';

class Home extends StatefulWidget {
  HomeLayout createState() => new HomeLayout();
}

class HomeLayout extends State<Home> {
  int _selectedIndex = 0;

  _widgetOptions(int pos) {
    switch (pos) {
      case 0:
        return new DashBoard();
      case 1:
        return  new ViewHunger();
      case 2:
        return MyApp.m_b_IsLoggedIn == true ? new SpotHunger() : new SignIn();
      default:
        return new Text("Error");
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//Location
  static Map<String, double> m_startLocation;
  static Map<String, double> m_currentLocation;
  StreamSubscription<Map<String, double>> m_locationSubscription;
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
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text('VV4'),
      actions: <Widget>[
        IconButton(
          icon: Icon(MyApp.m_b_IsLoggedIn == true
              ? Icons.verified_user
              : Icons.error_outline),
          tooltip: MyApp.m_b_IsLoggedIn == true ? 'Sign Out' : 'Sign In',
          onPressed: () {
            if (MyApp.m_b_IsLoggedIn == false) {
              var route = new MaterialPageRoute(
                builder: (BuildContext context) => new SignIn(),
              );
              Navigator.of(context).push(route);
            } else {
              DynamicWidgets.showToastAlert(context, "Logged-Out  ");
              MyApp.m_b_IsLoggedIn = false;
              var route = new MaterialPageRoute(
                builder: (BuildContext context) => new Home(),
              );
              Navigator.of(context).push(route);
            }
          },
        ),
      ],
    );

    final bottomNavigationBar = BottomNavigationBar(
      iconSize: 30.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), title: Text('Dashboard')),
        BottomNavigationBarItem(
            icon: Icon(Icons.map), title: Text('See Hunger')),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera), title: Text('Spot Hunger')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.white,
      onTap: _onItemTapped,
    );

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: topAppBar,
      drawer: new Drawer(),
      body: _widgetOptions(_selectedIndex),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(64, 75, 96, .9),
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))),
        child: bottomNavigationBar,
      ),
    );
  }
}

