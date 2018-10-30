import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class Splash extends StatefulWidget {
  @override
  SplashLayout createState() => new SplashLayout();
}

class SplashLayout extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 7,
      navigateAfterSeconds: 'Layouts/SignUpLayout',
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
