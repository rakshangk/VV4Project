import 'package:flutter/material.dart';
import 'package:vv4/Layouts/SpotHunger.dart';
import 'package:vv4/Layouts/ViewHunger.dart';
import 'package:vv4/main.dart';

class DashBoard extends StatefulWidget {
  DashBoardLayout createState() => new DashBoardLayout();
}

class DashBoardLayout extends State<DashBoard> {
  
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: new Drawer(),
      body: new Center(
        child: new Text('Dashboard'),
      )
    );
  }
}
