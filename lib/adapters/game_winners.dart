import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class GameWinnersAdapter extends StatefulWidget {

  const GameWinnersAdapter({Key key}) : super(key: key);

  @override
  State<GameWinnersAdapter> createState() => _GameWinnersAdapterState();

}

class _GameWinnersAdapterState extends State<GameWinnersAdapter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white.withOpacity(0.1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 33,
                height: 33,
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/ethereum.svg"),
              ),
              Container(width: 10,),
              const Text("Jacob", style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'lato-regular',
                fontWeight: FontWeight.w500
              ),)
            ]
          ),
          Container(height: 5,),
          Text("+\$230.00", style: TextStyle(
              color: Colors.green.withOpacity(0.7),
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: 'lato-regular'
          ),),
          Container(height: 8,),
          Text("8 min ago", style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: 'lato-regular'
          ),),
        ],
      ),
    );
  }

}
