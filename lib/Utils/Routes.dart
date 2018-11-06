import 'package:flutter/material.dart';
import 'package:vv4/Layouts/SignUpLayout.dart';
import 'package:vv4/Layouts/SplashLayout.dart';
import 'package:vv4/Layouts/SignInLayout.dart';
import 'package:vv4/Layouts/SpotHunger.dart';
import 'package:vv4/Layouts/SpotHungerPreview.dart';
import 'package:vv4/Layouts/DashBoard.dart';
import 'package:vv4/Layouts/ViewHunger.dart';

final routes = {
  'Layouts/SignUpLayout': (BuildContext context) => new SignUp(),
  'Layouts/SignInLayout': (BuildContext context) => new SignIn(),
  'Layouts/SplashLayout': (BuildContext context) => new Splash(),
  'Layouts/SpotHunger': (BuildContext context) => new SpotHunger(),
  'Layouts/DashBoard': (BuildContext context) => new DashBoard(),
  'Layouts/ViewHunger': (BuildContext context) => new ViewHunger(),
  'Layouts/SpotHungerPreview': (BuildContext context) =>
      new SpotHungerPreview(),
  '/': (BuildContext context) => new Splash(),
};
