import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/hex_color.dart';

class VerificationCompleteScreen extends StatefulWidget {

  const VerificationCompleteScreen({Key key}) : super(key: key);

  @override
  State<VerificationCompleteScreen> createState() => _VerificationCompleteScreenState();

}

class _VerificationCompleteScreenState extends State<VerificationCompleteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#03070A").withOpacity(0.7),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("#03070A").withOpacity(0.7),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verification complete", style: TextStyle(
              color: Colors.white,
              fontFamily: 'lato-bold',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),),
            Container(height: 40,),
            Container(
              height: 150,
              width: 200,
              alignment: Alignment.center,
              child: Image.asset("assets/images/check.png"),
            ),
            Container(height: 40,),
            Text("You’re all set. proceed to deposit and play to earn awesome prizes", textAlign: TextAlign.center, style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: 'lato-bold',
            ),),
            Container(height: 50,),
            GestureDetector(
              onTap: () {

              },
              child: Text("Done", style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                fontFamily: 'lato-bold',
                color: HexColor("#FC5EF6")
              ),),
            )
          ],
        ),
      ),
    );
  }

}
