import 'package:blitzwin/utilities/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatAdapter extends StatefulWidget {

  const ChatAdapter({Key key}) : super(key: key);

  @override
  State<ChatAdapter> createState() => _ChatAdapterState();

}

class _ChatAdapterState extends State<ChatAdapter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: HexColor("#040C12"),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/profile_pic.png", width: 42, height: 42,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Dwayne johnson", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'lato-bold',
                color: Colors.white,
              )),
              Container(
                height: 5,
              ),
              SizedBox(
                width: 330,
                child: Text("Can you smell what the rock is cooking. Can you smell what the rock is cooking", style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'lato-bold',
                  color: HexColor("#7F7F7F"),
                ), maxLines: 2,),
              ),
            ],
          ),
          Container(
            width: 21,
            height: 21,
            alignment: Alignment.center,
            child: SvgPicture.asset("assets/images/reply.svg"),
          )
        ],
      ),
    );
  }

}
