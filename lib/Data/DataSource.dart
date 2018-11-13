import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:vv4/Constants/URLConstants.dart';
import 'package:vv4/Layouts/Home.dart';
import 'package:vv4/Layouts/ViewHunger.dart';
import 'package:vv4/Models/SpottedList.dart';
import 'package:vv4/Models/User.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vv4/Layouts/DashBoard.dart';
import 'package:vv4/Widgets/DynamicWidgets.dart';
import 'package:vv4/Utils/Session.dart';
import 'package:image/image.dart' as Im;


class DataSource {
  DynamicWidgets oDynamicWidgets = new DynamicWidgets();
  String strErrorMessage;
  User oUser;
  Session oSession = new Session();

  static final LOGIN_URL = URLConstants.strLoginURL;

  String getBasicAuth(String strUsername, String strPassword) {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$strUsername:$strPassword'));
    print('****************BASIC AUTH KEY*********************');
    print(basicAuth);
    print('***************************************************');
    return basicAuth;
  }

  Future<User> login(
      BuildContext context, String strUsername, String strPassword) async {
    String strBasicAuth = getBasicAuth(strUsername, strPassword);

    return oSession.post(
        URLConstants.strLoginURL,
        {"username": strUsername, "password": strPassword},
        {'authorization': strBasicAuth}).then((dynamic response) {
      print(response.toString());
      if (response['m_bIsSuccess']) {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new Home(),
        );
        Navigator.of(context).push(route);
      } else {
        oDynamicWidgets.showAlertDialog(
            context, "Login Error", response['m_strResponseMessage']);
      }
    });
  }



  Future<User> spottedHunger(BuildContext context, String strGeoLocation,
      String nHungersCount, File imageFile,File thumbnailFile ) async {
    Im.Image image = Im.decodeImage(imageFile.readAsBytesSync());
    Im.Image thumbImage = Im.copyResize(image, 120);
    var compressedImage = new File(imageFile.path)..writeAsBytesSync(Im.encodeJpg(image, quality: 25));
    var ThumbnailImage = new File(thumbnailFile.path)..writeAsBytesSync(Im.encodeJpg(thumbImage, quality: 25));

    oSession.doMultipartRequest(
        context,
        URLConstants.strSpotedHunger,
        {
          "spotData":
              "{'m_strGeoLocation':$strGeoLocation,'m_nHungersCount':$nHungersCount}"
        },
        compressedImage,ThumbnailImage);
  }

  Future<SpottedList> fetchHungerList(){
    //return  oSession.fetchList(URLConstants.strSpotedList);
  }
}
