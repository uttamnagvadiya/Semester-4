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
            makeCard(label: "zoom", transitionStyle: Transition.zoom),
            makeCard(label: "circularReveal", transitionStyle: Transition.circularReveal),
            makeCard(label: "downToUp", transitionStyle: Transition.downToUp),
            makeCard(label: "fade", transitionStyle: Transition.fade),
            makeCard(label: "fadeIn", transitionStyle: Transition.fadeIn),
            makeCard(label: "leftToRight", transitionStyle: Transition.leftToRight),
            makeCard(label: "leftToRightWithFade", transitionStyle: Transition.leftToRightWithFade),
            makeCard(label: "upToDown", transitionStyle: Transition.upToDown),
            makeCard(label: "rightToLeftWithFade", transitionStyle: Transition.rightToLeftWithFade),
            makeCard(label: "rightToLeft", transitionStyle: Transition.rightToLeft),
            makeCard(label: "topLevel", transitionStyle: Transition.topLevel),
            makeCard(label: "native", transitionStyle: Transition.native),
            makeCard(label: "noTransition", transitionStyle: Transition.noTransition),
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
