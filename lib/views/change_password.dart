import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/hex_color.dart';

class ChangePasswordScreen extends StatefulWidget {

  const ChangePasswordScreen({Key key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();

}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final old_pc = TextEditingController();
  final new_pc = TextEditingController();
  final confirm_new_pc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#03070A").withOpacity(0.7),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Change password", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: 'lato-bold',
                ),),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(CupertinoIcons.xmark, size: 16, color: Colors.white,),
                ),
              ],
            ),
            Container(height: 15,),
            Text("Password must contain lowercase letters at least 1 \nnumber and 6 characters ",
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontFamily: 'lato-regular',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
            Container(height: 15,),
            TextFormField(
              controller: old_pc,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'lato-regular',
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                fillColor: HexColor("#040C12"),
                filled: true,
                contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                hintText: "Old password",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'lato-regular',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Container(height: 15,),
            TextFormField(
              controller: new_pc,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'lato-regular',
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                fillColor: HexColor("#040C12"),
                filled: true,
                contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                hintText: "New password",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'lato-regular',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Container(height: 15,),
            TextFormField(
              controller: confirm_new_pc,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                fillColor: HexColor("#040C12"),
                filled: true,
                contentPadding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                hintText: "Confirm new password",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'lato-regular',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'lato-regular',
                color: Colors.white,
              ),
            ),
            Container(height: 40,),
            Container(
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
                    Icon(CupertinoIcons.check_mark, size: 16, color: Colors.white,),
                    Container(width: 15,),
                    const Text("Save password", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'lato-regular',
                        color: Colors.white
                    ),)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}
