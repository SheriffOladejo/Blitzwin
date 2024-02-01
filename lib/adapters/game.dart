import 'package:flutter/material.dart';

class GameAdapter extends StatefulWidget {

  const GameAdapter({Key key}) : super(key: key);

  @override
  State<GameAdapter> createState() => _GameAdapterState();

}

class _GameAdapterState extends State<GameAdapter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage('assets/images/random_game.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
