import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirst_application/Navigation%20Animation/page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Animation"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            makeCard(label: "demo", transitionStyle: Transition.zoom),
            makeCard(label: "demo", transitionStyle: Transition.circularReveal),
            makeCard(label: "demo", transitionStyle: Transition.downToUp),
            makeCard(label: "demo", transitionStyle: Transition.fade),
            makeCard(label: "demo", transitionStyle: Transition.fadeIn),
            makeCard(label: "demo", transitionStyle: Transition.leftToRight),
            makeCard(label: "demo", transitionStyle: Transition.leftToRightWithFade),
            makeCard(label: "demo", transitionStyle: Transition.upToDown),
            makeCard(label: "demo", transitionStyle: Transition.rightToLeftWithFade),
            makeCard(label: "demo", transitionStyle: Transition.rightToLeft),
            makeCard(label: "demo", transitionStyle: Transition.topLevel),
            makeCard(label: "demo", transitionStyle: Transition.native),
            makeCard(label: "demo", transitionStyle: Transition.noTransition),
          ],
        ),
      ),
    );
  }

  Widget makeCard({label,transitionStyle}) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Card(
              color: Colors.black45,
              margin: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(label,
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            onTap: () {
              Get.to(() => const PageScreen(), transition: transitionStyle,
              duration: Duration(seconds: 1)
              );
            },
          ),
        ),
      ],
    );
  }
}
