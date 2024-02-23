import 'package:blitzwin/views/bottom_nav.dart';
import 'package:blitzwin/views/menu.dart';
import 'package:blitzwin/views/preferences.dart';
import 'package:blitzwin/views/profile.dart';
import 'package:blitzwin/views/security.dart';
import 'package:blitzwin/views/settings.dart';
import 'package:blitzwin/views/splash.dart';
import 'package:blitzwin/views/verification_complete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blitzwin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }

}

