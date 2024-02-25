import 'dart:convert';
import 'dart:math';

import 'package:blitzwin/utilities/utils.dart';
import 'package:blitzwin/views/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/app_user.dart';
import '../utilities/db_helper.dart';
import '../utilities/hex_color.dart';

class LoginScreen extends StatefulWidget {

  Function callback;
  LoginScreen({this.callback});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  bool obscureText = true;

  bool loading = false;

  final utils = Utils();

  DbHelper helper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#03070A").withOpacity(0.7),
      body: loading ?  const Center(child: CircularProgressIndicator(),) : Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("#03070A").withOpacity(0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text("Sign in", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      fontFamily: 'lato-regular'
                  )),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(CupertinoIcons.xmark, size: 14, color: Colors.white,),
                  )
                ]
            ),
            Container(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'lato-regular'
                  )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child:  const Text("  Sign up", style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'lato-regular'
                    )),
                  )
                ]
            ),
            Container(height: 20,),
            TextFormField(
              controller: email_controller,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'lato-regular',
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.white.withOpacity(0.7),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                fillColor: HexColor("#040C12"),
                filled: true,
                contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                hintText: "Enter email address",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'lato-regular',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Container(height: 20,),
            TextFormField(
              controller: password_controller,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'lato-regular',
                color: Colors.white,
              ),
              obscureText: obscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.lock_fill,
                  color: Colors.white.withOpacity(0.7),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                fillColor: HexColor("#040C12"),
                filled: true,
                contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                hintText: "Password",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'lato-regular',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Container(height: 30,),
            GestureDetector(
              onTap: () async {
                await login();
              },
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [HexColor("#F165F6"), HexColor("#55CDFE")], // Adjust colors as needed
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.mail_solid, size: 16, color: Colors.white,),
                      Container(width: 15,),
                      const Text("Sign in", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'lato-regular',
                          color: Colors.white
                      ),)
                    ],
                  )
              ),
            ),
            Container(height: 50,),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child:  const Text("Terms and conditions", style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'lato-regular'
              )),
            )
          ],
        ),
      ),
    );
  }



  Future<void> login () async {
    setState(() {
      loading = true;
    });

    if (utils.isValidEmail(email_controller.text.trim())) {
      final params = {
        "email": email_controller.text.trim(),
        "password": password_controller.text
      };

      const url = "https://www.camgirl.ng/blitzwin/login.php";

      final response = await utils.get(url, params);

      if (response != null) {
        Map<String, dynamic> result = jsonDecode(response.body);

        var message = result["ErrorMessage"];
        var code = result["ErrorCode"];

        if (code == 1) {
          utils.showToast(message);
        } else if (response.statusCode == 200 && code == 0) {
          AppUser user = await helper.getUserByEmail(email_controller.text.trim());
          await helper.saveUser(user);
          await widget.callback();
          await Navigator.pop(context);
        }
      }
    }
    else {
      utils.showToast("Invalid email");
    }

    setState(() {
      loading = false;
    });
  }

}
