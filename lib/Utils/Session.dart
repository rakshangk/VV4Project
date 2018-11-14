import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:vv4/Models/SpottedList.dart';
import 'package:vv4/Widgets/DynamicWidgets.dart';

class Session {
  DynamicWidgets oDynamicWidgets = new DynamicWidgets();
  Map<String, String> headers = {};

  Future<Map> get(String url) async {
    http.Response response = await http.get(url, headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  Future<Map> post(String url, dynamic data, dynamic headerParam) async {
    if (headerParam != null) {
      headers = headerParam;
    }
    print("Headers Inside Post : " + headers.toString());
    http.Response response = await http.post(url, body: data, headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  void doMultipartRequest(
      BuildContext context, String url, dynamic data, File imageFile,File thumbnail) async {
    print("Data : " + data.toString());

    var stream = new http.ByteStream(
        DelegatingStream.typed(imageFile.openRead()));
    var streamThumbnail = new http.ByteStream(
        DelegatingStream.typed(thumbnail.openRead()));

    var length = await imageFile.length();
    var thumbnilLength = await thumbnail.length();

    print("Length : " + length.toString());
    print("Thumbnail Length : " + thumbnilLength.toString());

    var request = new http.MultipartRequest("POST", Uri.parse(url));

    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    var multipartThumbnailFile = new http.MultipartFile(
        'file', streamThumbnail, thumbnilLength,
        filename: basename(thumbnail.path));

    request.fields.addAll(data);
    request.files.add(multipartFile);
    request.files.add(multipartThumbnailFile);
    request.headers.addAll(headers);

    var response = await request.send();
    print("Status Code : " + response.statusCode.toString());
    if (response.statusCode == 200) {
      oDynamicWidgets.showAlertDialogHome(
          context, "Shout for Food", "Hunger Spoted...");
    }
    else if (response.statusCode < 200 || response.statusCode > 400 ||
        json == null) {
      response.stream.transform(utf8.decoder).listen((value) {
        print("Value : " + value);
        oDynamicWidgets.showAlertDialogHome(
            context, "Shout for Food","Status Code :"+ response.statusCode.toString() + "  Server Error");
      });
    }
  }

  Future<Lists> fetchList (String strSpotedList,/*String strLatitude,String strLongitude*/) async {
    final response = await http.get (strSpotedList, headers: headers,
        //body: {"currentLatitude": strLatitude, "currentLongitude": strLongitude}
         );
    updateCookie (response);
    print ("Response : " + response.body);
    if (response.statusCode == 200)
    {
      return Lists.fromJson (json.decode (response.body));
    }
    else
    {
      throw Exception ('Failed to load post');
    }
  }

  void updateCookie(http.Response oResponse) {
    String strCookie = oResponse.headers['set-cookie'];
    if (strCookie != null) {
      int index = strCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? strCookie : strCookie.substring(0, index);
      print("Header" + headers.toString());
    }
  }
}
