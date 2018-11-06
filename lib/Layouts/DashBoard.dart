import 'package:flutter/material.dart';
import 'package:vv4/main.dart';

class DashBoard extends StatefulWidget {
  DashBoardLayout createState() => new DashBoardLayout();
}

class DashBoardLayout extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text('Dashboard'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.power_settings_new),
          onPressed: () {},
        )
      ],
    );

    final buttonSpotHunger = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Color.fromRGBO(58, 66, 86, 1.0),
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
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Text('See Hunger', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pushNamed('Layouts/ViewHunger');
          },
        ),
      ),
    );

    final makeBottom = Container(
      height: 60.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              tooltip: 'Dashboard',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.camera, color: Colors.white),
              tooltip: 'Spot Hunger',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.location_city, color: Colors.white),
              tooltip: 'Nearby Hungers',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.help_outline, color: Colors.white),
              tooltip: 'Help',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    final appDrawer = new Drawer(
      child: Container(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: new ListView(
          children: <Widget>[
            new Divider(color: Colors.white),
            new ListTile(
              trailing: new Icon(Icons.dashboard, color: Colors.white),
              title: new Text("Dashboard",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            new Divider(color: Colors.white),
            new ListTile(
                title: new Text("Spot hunger",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                trailing: new Icon(Icons.camera, color: Colors.white),
                onTap: () {}),
            new Divider(color: Colors.white),
            new ListTile(
                title: new Text("View hunger",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                trailing: new Icon(Icons.location_on, color: Colors.white),
                onTap: () {}),
            new Divider(color: Colors.white),
            new ListTile(
                title: new Text("Help",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                trailing: new Icon(Icons.help_outline, color: Colors.white),
                onTap: () {}),
            new Divider(color: Colors.white),
          ],
        ),
      ),
    );

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: topAppBar,
      drawer: appDrawer,
      body: new Container(
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
      bottomNavigationBar: makeBottom,
    );
  }
}
