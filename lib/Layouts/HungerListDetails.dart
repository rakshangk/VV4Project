import 'package:flutter/material.dart';
import 'package:vv4/Models/SpottedList.dart';

class HungerListDetails extends StatefulWidget {
  HungerListDetailsState createState() {
    return new HungerListDetailsState();
  }
}

class HungerListDetailsState extends State<HungerListDetails> {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        'Details',
        style: TextStyle(
          color: Color.fromRGBO(64, 75, 96, .9),
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
    );
    return Scaffold(
      appBar: appbar,
    );
  }
}
