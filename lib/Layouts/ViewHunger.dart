import 'package:flutter/material.dart';
import 'package:vv4/Lists/HungersList.dart';
import 'package:vv4/Models/SpottedList.dart';
import 'package:vv4/main.dart';

class ViewHunger extends StatefulWidget {
  ViewHungerState createState() => new ViewHungerState();
}

class ViewHungerState extends State<ViewHunger> {
  List<SpottedList> kSpottedList = <SpottedList>[
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
    new SpottedList('100', 'assets/login_bg.jpeg', '2 KM', 'MG ROAD'),
  ];
	//
  @override
  Widget build(BuildContext context) {
	  //List<SpottedList> kSpottedList=MyApp.m_oDataSource_main.fetchHungerList(context) as List<SpottedList>;
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text('Nearby Hungers'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );



    return new Scaffold(
      appBar: topAppBar,
      body: new Container(
        color: Color.fromRGBO(64, 75, 96, .9),
        padding: new EdgeInsets.all(1.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Expanded(
                child: new ListView(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              children: kSpottedList.map((SpottedList oSpottedList) {
                return new HungerItemList(oSpottedList);
              }).toList(),
            )),
          ],
        ),
      ),
    );
  }
}
