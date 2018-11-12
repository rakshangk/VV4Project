import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vv4/Lists/HungersList.dart';
import 'package:vv4/Models/SpottedList.dart';
import 'package:vv4/Utils/Session.dart';
import 'package:vv4/main.dart';
import 'package:http/http.dart' as http;

class ViewHunger extends StatefulWidget {

  ViewHungerState createState() => new ViewHungerState();
}

class ViewHungerState extends State<ViewHunger> {
  List<SpottedList> kSpottedList = <SpottedList>[
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),
    new SpottedList('101', 'https://s3-ap-southeast-1.amazonaws.com/vv4-images/1541421191558.jpg', '2 KM', 'MG ROAD'),


  ];
  Session oSession = new Session();
  //
  @override
  Widget build(BuildContext context) {
    //List<SpottedList> kSpottedList=MyApp.m_oDataSource_main.fetchHungerList(context) as List<SpottedList>;

    return new Scaffold(
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

/*
new Container(
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
 */
