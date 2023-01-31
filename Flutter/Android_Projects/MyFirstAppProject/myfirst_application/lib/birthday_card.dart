import 'package:flutter/material.dart';

class BirthdayCard extends StatefulWidget {
  const BirthdayCard({Key? key}) : super(key: key);

  @override
  State<BirthdayCard> createState() => _BirthdayCardState();
}

class _BirthdayCardState extends State<BirthdayCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/bdbg2.jpg",
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 100, 40, 0),
                    child: const Text("Life is Offering you a new year And I am so glad to share this special day with you, my dear\nI wish you lots of happiness on your special day.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pacifico',
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.bottomCenter,
                    child: const Text("Happy\nBirthday\nto\nYou",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontFamily: 'Pacifico'
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
