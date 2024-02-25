import 'package:blitzwin/utilities/hex_color.dart';
import 'package:blitzwin/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../adapters/game.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  final utils = Utils();

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
        actions: utils.loggedInAppBar()
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: HexColor("#03070A"),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 50,),
              ClipOval(
                child: Image.asset("assets/images/profile_pic2.png", fit: BoxFit.fill, width: 85, height: 85,),
              ),
              Container(height: 10,),
              Text("User12345", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                fontFamily: 'lato-bold',
              ),),
              Container(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 17,
                    height: 17,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/wallet.svg"),
                  ),
                  Container(width: 10,),
                  Text("Wallet balance", style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: 'lato-regular',
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),),
                ],
              ),
              Container(height: 10,),
              Text("\$1,234.00", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                fontFamily: 'lato-bold',
              ),),
              Container(height: 15,),
              MaterialButton(
                height: 50,
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyPhoneNumberScreen(
                  //   phone_number: "$country_code${phone_number_controller.text.trim()}",
                  // )));
                },
                color: HexColor("#1475E1"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        child: SvgPicture.asset("assets/images/wallet.svg", color: Colors.white,),
                      ),
                      Container(width: 10,),
                      Text("View wallet", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'lato-bold',
                      ),),
                    ],
                  )
                ),
              ),
              Container(height: 50,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/badge.svg"),
                  ),
                  Container(width: 10,),
                  Text("Activity", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'lato-bold',
                  ),),
                ],
              ),
              Container(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Games played", style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'lato-regular'
                      ),),
                      Container(height: 10,),
                      Text("125", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'lato-bold',
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Games won", style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'lato-regular'
                      ),),
                      Container(height: 10,),
                      Text("100", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'lato-bold',
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Games lost", style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'lato-regular'
                      ),),
                      Container(height: 10,),
                      Text("25", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'lato-bold',
                      ),),
                    ],
                  ),
                ],
              ),
              Container(height: 20,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/chart.svg"),
                  ),
                  Container(width: 10,),
                  Text("Statistics", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'lato-bold',
                  ),),
                ],
              ),
              Container(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Total wagered", style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'lato-regular'
                      ),),
                      Container(height: 10,),
                      Text("\$5,000", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'lato-bold',
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Earnings", style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'lato-regular'
                      ),),
                      Container(height: 10,),
                      Text("\$35,000", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'lato-bold',
                      ),),
                    ],
                  ),
                ],
              ),
              Container(height: 20,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/rocket.svg"),
                  ),
                  Container(width: 10,),
                  Text("Top games played", style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'lato-bold',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )),
                ],
              ),
              Container(height: 20,),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return GameAdapter();
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
