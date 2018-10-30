import 'package:flutter/material.dart';
import 'package:vv4/Utils/Routes.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'VV4',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: routes,
    );
  }
}