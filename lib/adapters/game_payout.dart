import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/hex_color.dart';

class GamePayoutAdapter extends StatefulWidget {

  const GamePayoutAdapter({Key key}) : super(key: key);

  @override
  State<GamePayoutAdapter> createState() => _GamePayoutAdapterState();

}

class _GamePayoutAdapterState extends State<GamePayoutAdapter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white.withOpacity(0.1)
      ),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            child: SvgPicture.asset("assets/images/payout_cards.svg"),
          ),
          Container(width: 8,),
          Text("Limbo", style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w700,
            fontSize: 18,
            fontFamily: 'lato-bold'
          ),),
          const Spacer(),
          Text("+\$230.00", style: TextStyle(
              color: Colors.green.withOpacity(0.7),
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: 'lato-regular'
          ),),
          Container(width: 8,),
          Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: HexColor("#627EEA"),
              borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: SvgPicture.asset("assets/images/ethereum.svg"),
          ),
        ],
      ),
    );
  }

}
