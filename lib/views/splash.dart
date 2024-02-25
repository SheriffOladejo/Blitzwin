import 'package:blitzwin/utilities/db_helper.dart';
import 'package:blitzwin/utilities/hex_color.dart';
import 'package:blitzwin/views/bottom_nav.dart';
import 'package:blitzwin/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#03070A"),
      ),
      body: Container(
        color: HexColor("#03070A"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/images/splash.svg"),
            ),
            Container(
              width: 175,
              height: 50,
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/images/splash_blitzwin.svg"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState () {
    super.initState();
    init();
  }

  Future<void> init () async {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    });
  }

}
