import 'dart:convert';

import 'package:blitzwin/adapters/game.dart';
import 'package:flutter/material.dart';
import '../adapters/game_payout.dart';
import '../adapters/game_winners.dart';
import '../utilities/constants.dart';
import '../utilities/gradient_text.dart';
import '../utilities/hex_color.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../models/app_user.dart';

class CasinoScreen extends StatefulWidget {

  const CasinoScreen({Key key}) : super(key: key);

  @override
  State<CasinoScreen> createState() => _CasinoScreenState();

}

class _CasinoScreenState extends State<CasinoScreen> {

  AppUser user;

  String selected_list = Constants.all;

  List<GamePayoutAdapter> payout_list = [
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
  ];

  Future<void> makePostRequest() async {

    final apiUrl = 'https://swmd.6633663.com/testcase/index2';

    // Replace the following values with your actual data
    final agentUrl = 'https://www.camgirl.ng/blitzwin/callback.php';
    final agentCode = 'E650';
    final memberName = 'E650';
    final secretKey = 'Sfh4Oj';
    final productId = '1006';
    final memberPassword = 'abcd1234';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'AgentURL': agentUrl,
        'AgentCode': agentCode,
        'MemberName': memberName,
        'SecretKey': secretKey,
        'ProductID': productId,
        'MemberPass': memberPassword,
      }),
    );

    if (response.statusCode == 200) {
      // Request successful, handle the response here
      print('Response: ${response.body}');
    } else {
      // Request failed, handle the error here
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState () {
    super.initState();
    makePostRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#03070A"),
        leading: Column(
            children: [
              Container(
                  width: 80,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/appbar_logo.svg")
              ),
              const Text("BLITZWIN", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  fontFamily: 'lato-bold',
                  color: Colors.white
              ),),
            ],
    ),
        actions: user == null ? [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              height: 50,
              width: 80,
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                    width: 1,
                    gradient: LinearGradient(
                      colors: [HexColor("#F165F6"), HexColor("#55CDFE")], // Adjust colors as needed
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              alignment: Alignment.center,
              child: GradientText("Login", style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'lato-regular',
              ),
                  gradient: LinearGradient(
                    colors: [HexColor("#F165F6"), HexColor("#55CDFE")], // Adjust colors as needed
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Stack (
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 47,
                      width: 80,
                      margin: const EdgeInsets.only(

                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [HexColor("#F165F6"), HexColor("#55CDFE")], // Adjust colors as needed
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Sign up", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'lato-regular',
                          color: Colors.white
                      ),)
                  ),
                  Container(
                    height: 200,
                    width: 100,
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset("assets/images/giftbox.svg"),
                  )
                ]
            ),
          ),
          Container(width: 15),
        ] : []
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          color: HexColor("#03070A"),
          child: Column(
            children: [
              Container(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    fillColor: HexColor("#040C12"),
                    filled: true,
                    contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    hintText: "Search your game",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontFamily: 'lato-regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7),)
                  ),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: 'lato-regular',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                  Text("New releases", style: TextStyle(
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
              Container(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_list = Constants.all;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: selected_list == Constants.all ? Colors.white.withOpacity(0.05) : HexColor(Constants.background_color),
                      ),
                      child: Text(Constants.all, style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato-regular',
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_list = Constants.casino_bets;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: selected_list == Constants.casino_bets ? Colors.white.withOpacity(0.05) : HexColor(Constants.background_color),
                      ),
                      child: const Text(Constants.casino_bets, style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato-regular',
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_list = Constants.slot_bets;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: selected_list == Constants.slot_bets ? Colors.white.withOpacity(0.05) : HexColor(Constants.background_color),
                      ),
                      child: const Text(Constants.slot_bets, style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato-regular',
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),),
                ],
              ),
              Container(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Game", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'lato-bold',
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("Payout", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'lato-bold',
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),)
                ],
              ),
              Container(height: 20,),
              ...payout_list,
              Container(height: 20,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/slot.svg"),
                  ),
                  Container(width: 10,),
                  Text("Slot", style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'lato-bold',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )),
                ],
              ),
              Container(height: 20,),
              Row(
                children: [
                  Container(
                    width: 23,
                    height: 21,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/trophy.svg"),
                  ),
                  Container(width: 15,),
                  const Text("Game winners", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: 'lato-bold'
                  ),)
                ],
              ),
              Container(height: 20,),
              SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 12,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GameWinnersAdapter();
                    }
                ),
              ),
              Container(height: 30,),
            ],
          )
        ),
      ),
    );
  }

}
