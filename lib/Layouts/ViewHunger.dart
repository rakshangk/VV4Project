import 'package:flutter/material.dart';
import 'package:vv4/Lists/HungersList.dart';
import 'package:vv4/Models/SpottedList.dart';

class ViewHunger extends StatefulWidget {
  ViewHungerState createState() => new ViewHungerState();
}

class ViewHungerState extends State<ViewHunger> {
  List<SpottedList> kSpottedList = <SpottedList>[
    //new SpottedList('200','assets/login_bg.jpeg','2Km','MG Road'),

    new SpottedList(m_HungersCount: '100',m_strImage: 'assets/login_bg.jpeg',m_strDistance: '2KM',m_strAddress: 'MG Road'),
   
  ];
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
