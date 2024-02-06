import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/hex_color.dart';

class PreferencesScreen extends StatefulWidget {

  const PreferencesScreen({Key key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();

}

class _PreferencesScreenState extends State<PreferencesScreen> {

  bool ghost_mode = false;
  bool zero_balance = false;
  bool fiat = false;

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
          children: [
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enable ghost mode", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      fontFamily: 'lato-bold'
                    ),),
                    Container(height: 10,),
                    Text("Your bets will not appear in public feed\nand bet preview", style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'lato-bold'
                    ),),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 40,
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                        value: ghost_mode,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            ghost_mode = !ghost_mode;
                          });
                        }
                    ),
                  ),
                )
              ],
            ),
            Container(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hide zero balances", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        fontFamily: 'lato-bold'
                    ),),
                    Container(height: 10,),
                    Text("Your zero balances will not appear in \nyour wallet", style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'lato-bold'
                    ),),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 40,
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                        value: zero_balance,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            zero_balance = !zero_balance;
                          });
                        }
                    ),
                  ),
                )
              ],
            ),
            Container(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Display in fiat", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        fontFamily: 'lato-bold'
                    ),),
                    Container(height: 10,),
                    Text("All bets and transactions will be \nsettled in crypto equivalent", style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'lato-bold'
                    ),),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 40,
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                        value: fiat,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            fiat = !fiat;
                          });
                        }
                    ),
                  ),
                )
              ],
            ),
            Container(height: 30,),
          ],
        ),
      ),
    );
  }

}
