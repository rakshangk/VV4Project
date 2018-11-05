import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  DashBoardLayout createState() => new DashBoardLayout();
}

class DashBoardLayout extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {

    final buttonSpotHunger = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blueGrey,
          child: Text('Spot Hunger', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pushNamed('Layouts/SpotHunger');
          },
        ),
      ),
    );

    final buttonViewHunger = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blueGrey,
          child: Text('See Hunger', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pushNamed('Layouts/ViewHunger');
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
              fit: BoxFit.scaleDown),
        ),
        child: Form(
          child: ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 128.0),
              buttonSpotHunger,
              SizedBox(height: 10.0),
              buttonViewHunger,
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
