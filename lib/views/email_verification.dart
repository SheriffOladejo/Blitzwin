import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/hex_color.dart';

class EmailVerificationDialog extends StatefulWidget {

  const EmailVerificationDialog({Key key}) : super(key: key);

  @override
  State<EmailVerificationDialog> createState() => _EmailVerificationDialogState();

}

class _EmailVerificationDialogState extends State<EmailVerificationDialog> {

  final email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#03070A").withOpacity(0.7),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        color: HexColor("#03070A").withOpacity(0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email verification", style: TextStyle(
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
            Container(height: 20,),
            Text("In order to deposit you have to verify your email first. Click the link in your email to verify", style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: 'lato-bold',
            ),),
            Container(height: 20,),
            TextFormField(
              controller: email_controller,
              style: TextStyle(
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
                hintText: "Email address",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'lato-regular',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Container(height: 30,),
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
                    Icon(CupertinoIcons.mail_solid, size: 16, color: Colors.white,),
                    Container(width: 15,),
                    const Text("Send verification email", style: TextStyle(
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
