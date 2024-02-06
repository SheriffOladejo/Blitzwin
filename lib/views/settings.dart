import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/hex_color.dart';

class SettingsScreen extends StatefulWidget {

  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#03070A"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            child: Icon(Icons.arrow_back, color: Colors.white,),
          ),
        ),
        title: const Text("Profile", style: TextStyle(
          color: Colors.white,
          fontFamily: 'lato-bold',
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/logos_bitcoin.png")
              ),
              Container(width: 8,),
              Text("\$0.00", style: TextStyle(
                color: Colors.white,
                fontFamily: 'lato-bold',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),),
              Container(width: 8,),
              const Icon(CupertinoIcons.chevron_down, color: Colors.white, size: 14,)
            ],
          ),
          Container(width: 15,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/profile_pic.png")
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Text(
                        '1', // You can set the number of notifications here
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(width: 8,),
              const Icon(CupertinoIcons.chevron_down, color: Colors.white, size: 14,),
              Container(width: 10,)
            ],
          ),
          Container(width: 15,),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        color: HexColor("#03070A"),
        child: Column(
          children: [
            Container(height: 30,),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/verified.svg"),
                ),
                Container(width: 15,),
                Text("Verification", style: TextStyle(
                  fontFamily: 'lato-regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7),
                ),),
                const Spacer(),
                Text("Verified", style: TextStyle(
                  fontFamily: 'lato-regular',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,
                ),),
              ],
            ),
            Container(height: 30,),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/shield.svg", color: Colors.white.withOpacity(0.7),),
                ),
                Container(width: 15,),
                Text("Security", style: TextStyle(
                  fontFamily: 'lato-regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7),
                ),),
              ],
            ),
            Container(height: 30,),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/prefs.svg"),
                ),
                Container(width: 15,),
                Text("Preferences", style: TextStyle(
                  fontFamily: 'lato-regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7),
                ),),
              ],
            ),
            Container(height: 30,),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/t_and_c.svg"),
                ),
                Container(width: 15,),
                Text("Terms and condition", style: TextStyle(
                  fontFamily: 'lato-regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7),
                ),),
              ],
            ),
            Container(height: 30,),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/pp.svg"),
                ),
                Container(width: 15,),
                Text("Privacy policy", style: TextStyle(
                  fontFamily: 'lato-regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7),
                ),),
              ],
            ),
            Container(height: 30,),
          ],
        ),
      ),
    );
  }

}
