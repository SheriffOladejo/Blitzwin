import 'package:blitzwin/utilities/hex_color.dart';
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
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 250,
              height: 250,
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/images/splash.svg"),
            ),
            Container(height: 15,),
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



}
