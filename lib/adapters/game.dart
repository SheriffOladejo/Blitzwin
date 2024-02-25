import 'dart:convert';

import 'package:blitzwin/utilities/constants.dart';
import 'package:blitzwin/utilities/utils.dart';
import 'package:blitzwin/views/launch_game.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/app_user.dart';
import '../utilities/db_helper.dart';

class GameAdapter extends StatefulWidget {

  const GameAdapter({Key key}) : super(key: key);

  @override
  State<GameAdapter> createState() => _GameAdapterState();

}

class _GameAdapterState extends State<GameAdapter> {

  final utils = Utils();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchGame();
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage('assets/images/random_game.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future<void> launchGame () async {
    DbHelper helper = DbHelper();
    AppUser user = await helper.getUser();
    var memberName = user.username;
    var messageID = "${DateTime.now().millisecondsSinceEpoch}_$memberName";
    var requestTime_ = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    var requestTime = DateTime.now().millisecondsSinceEpoch.toString();
    var password = user.password;
    var methodName = "launchgame";

    var ip = await utils.ipAddress();

    Map<String, String> params = {
      'OperatorCode': Constants.operatorCode.toString(),
      'MemberName': 'qwertyuiop',
      'ProductID': '1002',
      'GameType': '2',
      'LanguageCode': '1',
      'Platform': '0',
      'IPAddress': ip.toString(),
      'Sign': utils.generateMD5Signature(requestTime, methodName).toString(),
      'RequestTime': requestTime_.toString(),
      'Password': 'abcd1234',
    };

    print(params);

    final response = await utils.post("https://swmd.6633663.com/Seamless/LaunchGame", jsonEncode(params));

    if (response != null) {
      print("launch game response: ${response.body}");
      var result = jsonDecode(response.body);
      var url = result["Url"];
      if (url != "" && url != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LaunchGameScreen(url: url,)),
        );
      }

    }



  }

}
