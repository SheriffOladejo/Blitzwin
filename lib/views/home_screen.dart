import 'package:blitzwin/adapters/game_payout.dart';
import 'package:blitzwin/adapters/game_winners.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../adapters/game.dart';
import '../models/app_user.dart';
import '../utilities/constants.dart';
import '../utilities/gradient_text.dart';
import '../utilities/hex_color.dart';

class HomeScreen extends StatefulWidget {

  Function callback;
  HomeScreen({this.callback});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  String blitzwinStory = '''
In the vibrant world of online gambling, a new player has emerged, ready to shake things up. Blitzwin, a cutting-edge betting app, had its eyes set on becoming the go-to platform for casino enthusiasts and sports bettors alike. Inspired by the success of platforms like Stake.com, Blitzwin aims to revolutionize the crypto betting experience.

Founded by a team of tech-savvy entrepreneurs, Blitzwin quickly gains attention with its sleek design and user-friendly interface. The app boasted a range of casino games and sports betting options, all accessible with cryptocurrencies like Bitcoin. The founders take inspiration from the success story of Stake.com, acknowledging its role as a trailblazer in the crypto gambling industry.

In the heart of the app's success is a feature-rich casino section, offering a wide array of games that mirrored the diversity seen on Stake.com. From classic slot machines to live dealer games, Blitzwin aims to cater to every gambling taste. The founders know that to compete with giants like Stake.com, they had to provide an experience that was not just good but outstanding.

Blitzwin's success story is a testament to the ever-expanding world of crypto gambling. It joined the ranks of influential platforms, proving that the appetite for innovative betting experiences, driven by cryptocurrencies, was insatiable. As the crypto casino industry continued to evolve, Blitzwin stands as a symbol of progress, following in the footsteps of pioneers like Stake.com.
''';


  bool show_more = false;

  AppUser user;

  final List<String> imagePaths = [
    'assets/images/litecoin.svg',
    'assets/images/tether.svg',
    'assets/images/bitcoin.svg',
    'assets/images/ethereum_text.svg',
    'assets/images/tron.svg',
    'assets/images/ripple.svg',
    'assets/images/dogecoin.svg',
    'assets/images/bitcoin_cash.svg',
  ];

  List<GamePayoutAdapter> payout_list = [
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
    GamePayoutAdapter(),
  ];

  String selected_list = Constants.all;

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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: HexColor("#03070A"),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 50,),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/game_pad.svg"),
                  ),
                  Container(width: 10,),
                  Text("Games you should try", style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'lato-bold',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )),
                ],
              ),
              Container(height: 20,),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return GameAdapter();
                    }
                ),
              ),
              Container(height: 20,),
              Image.asset("assets/images/home_casino.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              Container(height: 15,),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text("Leading online crypto casino", style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'lato-bold',
                  fontSize: 14,
                  fontWeight: FontWeight.w800
                ),),
              ),
              Container(height: 10,),
              const Text("Browse our giant range of casino games as Blitzwin offers a fair and fun online gambling experience. Play Slots, Live Casino, Blackjack, Baccarat, Roulette, and thousands of classic casino games right from your phone, including your favourite Blitzwin Originals.", style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'lato-regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),),
              Container(height: 20,),
              GestureDetector(
                onTap: () {
                  widget.callback(2);
                },
                child: Container(
                    height: 45,
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
                    child: const Text("Go to casino", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'lato-regular',
                        color: Colors.white
                    ),)
                ),
              ),
              Container(height: 30,),
              const Text("No crypto? No problem.", style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'lato-bold',
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
              Container(height: 20,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: const BorderRadius.all(Radius.circular(8))
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 20,),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: SvgPicture.asset("assets/images/apple_pay.svg"),
                    ),
                    Container(width: 3,),
                    const Text("Buy crypto", style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      fontFamily: 'lato-bold',
                      color: Colors.white,
                    ),),
                    Container(width: 20,),
                  ],
                ),
              ),
              Container(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_list = Constants.all;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: selected_list == Constants.all ? Colors.white.withOpacity(0.05) : HexColor(Constants.background_color),
                      ),
                      child: Text(Constants.all, style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato-regular',
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_list = Constants.casino_bets;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: selected_list == Constants.casino_bets ? Colors.white.withOpacity(0.05) : HexColor(Constants.background_color),
                      ),
                      child: const Text(Constants.casino_bets, style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato-regular',
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_list = Constants.slot_bets;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: selected_list == Constants.slot_bets ? Colors.white.withOpacity(0.05) : HexColor(Constants.background_color),
                      ),
                      child: const Text(Constants.slot_bets, style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato-regular',
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),),
                ],
              ),
              Container(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Game", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'lato-bold',
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("Payout", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'lato-bold',
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),)
                ],
              ),
              Container(height: 20,),
              ...payout_list,
              Container(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text("Blitzwin - Crypto casino platform", style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'lato-bold',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),),
              ),
              Container(height: 15,),
              SizedBox(
                height: show_more ? 500 : 80,
                width: MediaQuery.of(context).size.width,
                child: Text(blitzwinStory, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'lato-regular',
                  fontSize: 14
                ),),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    show_more = !show_more;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(show_more ? "Show less" : "Show more", style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'lato-bold',
                          fontSize: 14,
                          fontWeight: FontWeight.w800
                      ),),
                      Container(width: 10,),
                      Container(
                        width: 10,
                        height: 11,
                        alignment: Alignment.center,
                        child: SvgPicture.asset("assets/images/show_more.svg"),
                      )
                    ],
                  ),
                ),
              ),
              Container(height: 20,),
              const Text("We support", style: TextStyle(
                color: Colors.white,
                fontFamily: 'lato-bold',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 3.0
                  ),
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 130,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        imagePaths[index]
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 23,
                    height: 21,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/images/trophy.svg"),
                  ),
                  Container(width: 15,),
                  const Text("Game winners", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'lato-bold'
                  ),)
                ],
              ),
              Container(height: 20,),
              SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GameWinnersAdapter();
                  }
                ),
              ),
              Container(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

}
