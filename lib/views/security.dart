import 'package:blitzwin/views/change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecurityScreen extends StatefulWidget {

  const SecurityScreen({Key key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();

}

class _SecurityScreenState extends State<SecurityScreen> {

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
        title: const Text("Security", style: TextStyle(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 30,),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ChangePasswordScreen();
                  }
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/lock.svg"),
                  ),
                  Container(width: 15,),
                  Text("Change passwords", style: TextStyle(
                    fontFamily: 'lato-regular',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),)
                ]
              ),
            ),
            Container(height: 50,),
            Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/google.svg"),
                  ),
                  Container(width: 15,),
                  Text("Enable 2FA", style: TextStyle(
                      fontFamily: 'lato-regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),)
                ]
            )
          ],
        ),
      ),
    );
  }

}
