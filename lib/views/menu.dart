import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../utilities/gradient_text.dart';
import '../utilities/hex_color.dart';

import '../models/app_user.dart';

class MenuScreen extends StatefulWidget {

  const MenuScreen({Key key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();

}

class _MenuScreenState extends State<MenuScreen> {

  AppUser user;

  final search_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: HexColor("#03070A"),
          elevation: 0,
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("#03070A"),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: HexColor("#141414"),
              ),
              child: TextFormField(
                controller: search_controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search, color: Colors.white.withOpacity(0.7),),
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  hintText: "Search your game",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'lato-regular',
                  ),
                ),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'lato-regular',
                ),
              ),
            ),
            Container(height: 10,),
            user == null ? Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/menu_bg.png"),
                Container(
                  width: 75,
                  height: 85,
                  margin: const EdgeInsets.only(bottom: 50),
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/padlock.svg"),
                )
              ],
            ) : Container(),
            user == null ? Container(height: 15,) : Container(),
            user == null ? const Text("Signup to unlock", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'lato-regular',
                color: Colors.white
            ),) : Container(),
            user == null ? Container(height: 15,) : Container(),
            user == null ? Container(
                height: 50,
                width: 250,
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
                child: const Text("Unlock and win \$1,000,000", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'lato-regular',
                    color: Colors.white
                ),)
            ) : Container(),
            Container(height: 30,),
            GestureDetector(
              onTap: () {

              },
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/profile.svg", color: Colors.white.withOpacity(0.7)),
                  ),
                  Container(width: 20,),
                  Text("Profile", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'lato-regular',
                      color: Colors.white.withOpacity(0.7)
                  ),)
                ],
              ),
            ),
            Container(height: 30,),
            GestureDetector(
              onTap: () {

              },
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/gem.svg", color: Colors.white.withOpacity(0.7)),
                  ),
                  Container(width: 20,),
                  Text("Casino", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'lato-regular',
                      color: Colors.white.withOpacity(0.7)
                  ),)
                ],
              ),
            ),
            Container(height: 30,),
            GestureDetector(
              onTap: () {

              },
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/user_group.svg", color: Colors.white.withOpacity(0.7)),
                  ),
                  Container(width: 20,),
                  Text("Refer and earn", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'lato-regular',
                      color: Colors.white.withOpacity(0.7)
                  ),),
                  const Spacer(),
                  Text("Coming soon", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      fontFamily: 'lato-regular',
                      color: HexColor("#FFFFFFB2")
                  ),),

                ],
              ),
            ),
            Container(height: 30,),
            GestureDetector(
              onTap: () {

              },
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/support.svg", color: Colors.white.withOpacity(0.7)),
                  ),
                  Container(width: 20,),
                  Text("Contact support", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'lato-regular',
                      color: Colors.white.withOpacity(0.7)
                  ),)
                ],
              ),
            ),
            Container(height: 30,),
            GestureDetector(
              onTap: () {

              },
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/settings.svg", color: Colors.white.withOpacity(0.7)),
                  ),
                  Container(width: 20,),
                  Text("Settings", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'lato-regular',
                      color: Colors.white.withOpacity(0.7)
                  ),)
                ],
              ),
            ),
            Container(height: 30,),
          ],
        ),
      ),
    );
  }

}
