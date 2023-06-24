import 'dart:async';
import 'package:demo/college_list.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 4),
  //     () => Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const CollegeList(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/bg3.jpg',
                    fit: BoxFit.fill,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            color: Colors.black54,
                            child: const Text('Devloped by Uttam Nagvadiya',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black26,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customImageContainer(imgPath: "assets/images/logo_du.png", imgHeight: screenHeight * 0.08,),
                          customImageContainer(imgPath: "assets/images/logo_aswdc-removebg-preview.png", imgHeight: screenHeight * 0.1,),
                        ],
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

  //region CUSTOM IMAGE CONTAINER...
  Widget customImageContainer ({imgPath, imgHeight}){
    return Container(
      margin: EdgeInsets.all(5),
      child: Image.asset(
        imgPath,
        height: imgHeight,
        filterQuality: FilterQuality.high,
      ),
    );
  }
  //endregion
}