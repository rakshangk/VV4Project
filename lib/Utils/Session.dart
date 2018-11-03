import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:vv4/Widgets/DynamicWidgets.dart';

class Session {
	DynamicWidgets oDynamicWidgets = new DynamicWidgets();
	Map<String, String> headers = {};

	Future<Map> get(String url) async {
		http.Response response = await http.get(url, headers: headers);
		updateCookie(response);
		return json.decode(response.body);
	}

	Future<Map> post(String url, dynamic data,dynamic headerParam) async {

		if(headerParam!=null){
			headers=headerParam;
		}
		print("Headers Inside Post : "+headers.toString());
		http.Response response = await http.post(url, body: data, headers: headers);

		updateCookie(response);
		return json.decode(response.body);
	}

	void doMultipartRequest(BuildContext context,String url, dynamic data, File imageFile) async {

		print("Data : "+data.toString());
		var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
		var length = await imageFile.length();
		var request = new http.MultipartRequest("POST", Uri.parse(url));

		var multipartFile = new http.MultipartFile('file', stream, length,
				filename: basename(imageFile.path));

		request.fields.addAll(data);
		request.files.add(multipartFile);
		request.headers.addAll(headers);

		var response = await request.send();
		print("Status Code : "+response.statusCode.toString());
		//oDynamicWidgets.showAlertDialog(context, "Image Upload", response.toString());
		response.stream.transform(utf8.decoder).listen((value) {
			print("Value : "+value);
		});
	}

	void updateCookie(http.Response response) {
		String rawCookie = response.headers['set-cookie'];
		if (rawCookie != null) {
			int index = rawCookie.indexOf(';');
			headers['cookie'] =
			(index == -1) ? rawCookie : rawCookie.substring(0, index);
			print("Header"+headers.toString());
		}
	}
}