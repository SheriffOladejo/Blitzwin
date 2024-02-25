import 'package:blitzwin/utilities/db_helper.dart';
import 'package:blitzwin/views/login.dart';
import 'package:blitzwin/views/signup.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_borders/gradient_borders.dart';
import '../models/app_user.dart';
import 'constants.dart' as cons;
import 'gradient_text.dart';
import 'hex_color.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Utils {
  Future<http.Response> post (url, params) async {

    try {
      return await http.post(
        Uri.parse(url),
        body: params,
        headers: {'content-type': 'application/json'}
      );
    }
    catch(e) {
      showToast("An error occurred: ${e.toString()}");
      return null;
    }
  }


  Future<http.Response> get (url, Map<String, dynamic> params) async {

    try {
      return await http.get(
          Uri.parse(url).replace(queryParameters: params)
      );
    }
    catch(e) {
      showToast("An error occurred: ${e.toString()}");
      return null;
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    return emailRegex.hasMatch(email);
  }

  String generateMD5Signature(String requestTime, String methodName) {
    String dataToSign = cons.Constants.operatorCode + requestTime + methodName + cons.Constants.secretKey;
    List<int> bytes = utf8.encode(dataToSign);
    Digest md5Digest = md5.convert(bytes);
    String md5Signature = md5Digest.toString();
    return md5Signature;
  }

  Future<String> ipAddress () async {
    var ipAddress = IpAddress();
    dynamic data = await ipAddress.getIpAddress();
    return data.toString();
  }

  List<Widget> loggedInAppBar () {
    return [
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
    ];
  }

  List<Widget> loggedOutAppbar (BuildContext context, Function callback) {
    return [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen(callback: callback,)),
          );
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen(callback: callback)),
          );
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
    ];
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,

    );
  }
}