import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  SplashLayout createState() => new SplashLayout();
}

class SplashLayout extends State<Splash> {

	StreamSubscription<Map<String, double>> m_locationSubscription;

	Map<String, double> m_startLocation;
	Map<String, double> m_currentLocation;
	bool m_bPermission = false;
	String m_strError;
	bool m_bcurrentWidget = true;
	Location m_oLocation = new Location();

	@override
	void initState() {
		super.initState();
		initPlatformState();
		m_locationSubscription =
				m_oLocation.onLocationChanged().listen((Map<String, double> result) {
					setState(() {
						m_currentLocation = result;
					});
				});
	}

	initPlatformState() async {
		Map<String, double> location;
		try {
			m_bPermission = await m_oLocation.hasPermission();
			location = await m_oLocation.getLocation();
			m_strError = null;
		} catch (e) {
			if (e.code == 'PERMISSION_DENIED') {
				m_strError = 'Permission denied';
			} else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
				m_strError =
				'Permission denied - please ask the user to enable it from the app settings';
			}
			location = null;
		}
		setState(() {
			m_startLocation = location;
		});
	}

  @override
  Widget build(BuildContext context) {

			return new SplashScreen(
				seconds: 7,
				navigateAfterSeconds: 'Layouts/Home',
				title: new Text(
					'We Volunter For',
					style: new TextStyle(
						fontWeight: FontWeight.bold,
						fontSize: 25.0,
						color: Colors.black,
					),
				),
				image: new Image.network(
						'http://techmust.com/wp-content/uploads/2018/04/cropped-TechMust_Board-250-1.jpg'),
				backgroundColor: Colors.white,
				styleTextUnderTheLoader: new TextStyle(),
				photoSize: 100.0,
				loaderColor: Colors.red,
			);
		}

  }
