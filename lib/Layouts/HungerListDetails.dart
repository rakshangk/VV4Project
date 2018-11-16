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
  fetchAddress()
  {
    final coordinates = new Coordinates(1.10, 45.50);
    var addresses =  Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses;
    print("${first} : ${first}");
  }

  openMap() async {
    var url = 'https://www.google.com/maps/search/?api=1&query=${widget.m_strLatitude},${widget.m_strLongitude}';
    if (Platform.isIOS) {
      url = 'http://maps.apple.com/?${widget.m_strLatitude},${widget.m_strLongitude}';
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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

    final imageMap = AspectRatio(
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
        ));
    final buttonSignIn = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 60.0,
          color: Color.fromRGBO(64, 75, 96, .9),
          child: Text('Navigate to Map', style: TextStyle(color: Colors.white)),
          onPressed: () {
            //fetchAddress();
         openMap();
          },
        ),
      ),
    );
    final strAddress = Text(
      'Address :' + 'M G Road, Bangeluru',
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
        children: <Widget>[strHungersCount, strAddress],
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
          children: <Widget>[imagePreview, imageMap, AddressColumn, buttonSignIn],
        ),
      ),
    );
  }
}
