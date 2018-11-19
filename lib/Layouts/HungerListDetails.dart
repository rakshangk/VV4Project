import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoder/geocoder.dart';

class HungerListDetails extends StatefulWidget {
  String m_strImagePreview, m_strLatitude, m_strLongitude, m_strHungersCount;
  HungerListDetails({Key key, this.m_strImagePreview, this.m_strLatitude, this.m_strLongitude, this.m_strHungersCount}) : super(key: key);
  HungerListDetailsState createState() {
    return new HungerListDetailsState();
  }
}

var strGoogleMapAPIKey = 'AIzaSyAsbdSE9FzMzI3xyDzkzL73rZG3zvMG7sE';

class HungerListDetailsState extends State<HungerListDetails> {
  var strAddressName;
  var strAddressLine;
  fetchAddress() async {
    final coordinates = new Coordinates(1.10, 45.50);
    var varAddresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = varAddresses.first;
    strAddressName = first.featureName;
    strAddressLine = first.addressLine;
    print("${first.featureName} : ${first.addressLine}");
  }

  openMap() async {
    var varURL = 'https://www.google.com/maps/search/?api=1&query=${widget.m_strLatitude},${widget.m_strLongitude}';
    if (Platform.isIOS) {
      varURL = 'http://maps.apple.com/?${widget.m_strLatitude},${widget.m_strLongitude}';
    }
    if (await canLaunch(varURL)) {
      await launch(varURL);
    } else {
      throw 'Could not launch $varURL';
    }
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

    final imagePreview = AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        child: Image.network(
          widget.m_strImagePreview,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Color.fromRGBO(64, 75, 96, .9),
            width: 10.0,
          ),
        ),
      ),
    );

    final imageMap = GestureDetector(
      onTap: openMap,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                "https://maps.googleapis.com/maps/api/staticmap?center=${widget.m_strLatitude},${widget.m_strLongitude}&zoom=18&scale=false&size=600x300&maptype=roadmap&key=AIzaSyCEjl75z4NwuDXoL9hbEVqJ8ec6Zm0tOlw&format=gif&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C${widget.m_strLatitude},${widget.m_strLongitude}",
                fit: BoxFit.fitWidth,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Color.fromRGBO(64, 75, 96, .9),
                  width: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );


    final strAddressLine1 = Text(
      'Hi',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );

    final strAddressLine2 = Text(
      'Hello',
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

    final AddressColumn = Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[strHungersCount, strAddressLine1, strAddressLine2],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(64, 75, 96, .9),
          width: 10.0,
        ),
      ),
    );

    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: appbar,
      body: new Container(
        child: ListView(
          children: <Widget>[imagePreview, imageMap, AddressColumn,],
        ),
      ),
    );
  }
}
