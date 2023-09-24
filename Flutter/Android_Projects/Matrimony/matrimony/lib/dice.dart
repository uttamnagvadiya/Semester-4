import 'dart:math';

import 'package:flutter/material.dart';
int i = Random().nextInt(6)+1;
class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                i = Random().nextInt(6)+1;
              });
            },
            child: Image.asset(
              "assets/images/dice$i.png",
            ),
          ),
        ),
      ),
    );
  }
}
