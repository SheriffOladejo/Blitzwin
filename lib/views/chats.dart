import 'package:blitzwin/adapters/chat.dart';
import 'package:blitzwin/models/app_user.dart';
import 'package:blitzwin/utilities/db_helper.dart';
import 'package:blitzwin/utilities/utils.dart';
import 'package:flutter/material.dart';
import '../utilities/gradient_text.dart';
import '../utilities/hex_color.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/hex_color.dart';

class ChatsScreen extends StatefulWidget {

  const ChatsScreen({Key key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();

}

class _ChatsScreenState extends State<ChatsScreen> {

  AppUser user;

  final message_controller = TextEditingController();

  final utils = Utils();

  DbHelper helper = DbHelper();

  Future<void> init () async {
    user = await helper.getUser();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> callback () async {
    user = await helper.getUser();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
          backgroundColor: HexColor("#03070A"),
          actions: user == null ? utils.loggedOutAppbar(context, callback) : utils.loggedInAppBar()
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 50,
        padding: const EdgeInsets.only(bottom: 70),
        color: HexColor("#03070A"),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ChatAdapter();
          }
        ),
      ),
      bottomSheet: Container(
        color: HexColor("#03070A"),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/profile_pic.png", width: 42, height: 42,),
            SizedBox(
              height: 40,
              width: 300,
              child: TextFormField(
                controller: message_controller,
                decoration: InputDecoration(
                  suffixIcon: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/emoji.svg"),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  hintText: "Type your message",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'worksans-regular',
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'worksans-regular',
                ),
              ),
            ),
            Container(
                width: 45,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor("#1475E1")
                ),
                child: SvgPicture.asset("assets/images/send.svg")
            ),
          ],
        ),
      )
    );
  }

}
