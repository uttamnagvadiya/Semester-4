import 'dart:async';
import 'package:demo/college_list.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CollegeList(),
        ),
      ),
    );
  }

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
                  Image.asset("assets/images/bg_splash_architecture.png", fit: BoxFit.fill,),
                  Container(color: const Color(0x78AB00AB),),
                  Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.3),
                    child: Center(
                      child: Image.asset(
                        "assets/images/logo_architecture.png",
                        height: screenHeight * 0.17,
                        width: screenWidth * 0.35,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customImageContainer(imgPath: "assets/images/logo_du.png", imgHeight: screenHeight * 0.08,),
                  customImageContainer(imgPath: "assets/images/logo_aswdc.png", imgHeight: screenHeight * 0.1,),
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
