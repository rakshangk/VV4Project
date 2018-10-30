import 'package:flutter/material.dart';
import 'package:vv4/Layouts/SignUpLayout.dart';
import 'package:vv4/Layouts/SplashLayout.dart';
import 'package:vv4/Layouts/SignInLayout.dart';
import 'package:vv4/Layouts/ShoutForFood.dart';
import 'package:vv4/Layouts/ShoutForFoodPreview.dart';


final routes = {
	'Layouts/SignUpLayout':         (BuildContext context) => new SignUp(),
	'Layouts/SignInLayout':         (BuildContext context) => new SignIn(),
	'Layouts/SplashLayout':         (BuildContext context) => new Splash(),
	'Layouts/ShoutForFood':         (BuildContext context) => new ShoutForFood(),
	'Layouts/ShoutForFoodPreview':  (BuildContext context) => new ShoutForFoodPreview(),
	'/'                   :          (BuildContext context) => new Splash(),

};

