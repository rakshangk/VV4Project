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
import 'package:image/image.dart' as ImagePackage;
import 'package:vv4/main.dart';


class DataSource
{

  DynamicWidgets        m_oDynamicWidgets = new DynamicWidgets();
  Session               m_oSession = new Session();
  static final          LOGIN_URL = URLConstants.strLoginURL;

  String getBasicAuth(String strUsername, String strPassword)
  {
    String strBasicAuth ='Basic ' + base64Encode(utf8.encode('$strUsername:$strPassword'));
    print('****************BASIC AUTH KEY*********************');
    print(strBasicAuth);
    print('***************************************************');
    return strBasicAuth;
  }

  Future<User> login(BuildContext context, String strUsername, String strPassword) async
  {
    String strBasicAuth = getBasicAuth(strUsername, strPassword);
    return m_oSession.post(URLConstants.strLoginURL,{"username": strUsername, "password": strPassword},{'authorization': strBasicAuth}).then((dynamic response)
    {
      print(response.toString());
      if (response['m_bIsSuccess'])
      {
          DynamicWidgets.showToastAlert(context,"Logged-in as  "+strUsername.toString());
          MyApp.m_b_IsLoggedIn = true;
          MyApp.strUsername = strUsername.toString();
          var route = new MaterialPageRoute(builder: (BuildContext context) => new Home(),);
          Navigator.of(context).push(route);
      }
      else
      {
          DynamicWidgets.showToastAlert(context," Please enter valid username and password ");
          m_oDynamicWidgets.showAlertDialog(context, "Login Error", response['m_strResponseMessage']);
      }
    });
  }

  Future<User> spottedHunger(BuildContext context, String strLatitude,String strLongitude,String nHungersCount, File strImageFile,File strThumbnailFile ) async
  {
    var strCapturedImageSize =await strImageFile.length();
    print("CapturedImageSize : " + strCapturedImageSize.toString());

    ImagePackage.Image      oSpotImage = ImagePackage.decodeImage(await  strImageFile.readAsBytesSync());
    ImagePackage.Image      oThumbSpotImage = ImagePackage.copyResize(oSpotImage, 120);
    var           compressedImage = new File(strImageFile.path)..writeAsBytesSync(ImagePackage.encodeJpg(oSpotImage, quality: 25));
    var           ThumbnailImage = new File(strThumbnailFile.path)..writeAsBytesSync(ImagePackage.encodeJpg(oThumbSpotImage, quality: 25));

    m_oSession.doMultipartRequest(context,URLConstants.strSpotedHunger,{"spotData":"{'m_nLatitude':$strLatitude,'m_nLongitude':$strLongitude,'m_nHungersCount':$nHungersCount}"},strImageFile,strThumbnailFile);
}

  Future<Lists> fetchHungerList(String strLatitude,String strLongitude)
  {
    /*print('Latitude :'+strLatitude);
    print('Longitude :'+strLongitude);*/
    return  m_oSession.fetchList(URLConstants.strSpotedList, strLatitude, strLongitude,);
  }


}
