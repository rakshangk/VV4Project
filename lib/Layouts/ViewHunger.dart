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
  Session oSession = new Session();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Opportunities to Feed',
          style: TextStyle(
            color: Color.fromRGBO (64, 75, 96, .9),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<Lists>(
          future: MyApp.m_oDataSource_main.fetchHungerList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Container(
                child: Column(
                  children: <Widget>[
                    new Expanded(
                        child: new ListView(
                      padding: new EdgeInsets.symmetric(vertical: 0.0),
                      children:
                          snapshot.data.kLists.map((SpottedList oSpottedList) {
                        return new HungerItemList(oSpottedList);
                      }).toList(),
                    )),
                  ],
                ),
              );
            } else if (snapshot == null || snapshot.hasError) {
              return Text("could not get response");
            }
            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
