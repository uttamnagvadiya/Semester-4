import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoaders extends StatefulWidget {
  const CustomLoaders({Key? key}) : super(key: key);

  @override
  State<CustomLoaders> createState() => _CustomLoadersState();
}

class _CustomLoadersState extends State<CustomLoaders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Loaders')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitFoldingCube(color: Colors.white,)),
                getLoaders(SpinKitThreeInOut(color: Colors.white,)),
                getLoaders(SpinKitPumpingHeart(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitWave(color: Colors.white,)),
                getLoaders(SpinKitChasingDots(color: Colors.white,)),
                getLoaders(SpinKitCircle(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitCubeGrid(color: Colors.white,)),
                getLoaders(SpinKitDancingSquare(color: Colors.white,)),
                getLoaders(SpinKitDoubleBounce(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitDualRing(color: Colors.white,)),
                getLoaders(SpinKitFadingCircle(color: Colors.white,)),
                getLoaders(SpinKitFadingCube(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitFadingFour(color: Colors.white,)),
                getLoaders(SpinKitFadingGrid(color: Colors.white,)),
                getLoaders(SpinKitHourGlass(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitPianoWave(color: Colors.white,)),
                getLoaders(SpinKitPouringHourGlass(color: Colors.white,)),
                getLoaders(SpinKitPouringHourGlassRefined(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitPulse(color: Colors.white,)),
                getLoaders(SpinKitPulsingGrid(color: Colors.white,))  ,
                getLoaders(SpinKitRotatingPlain(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitRing(color: Colors.white,)),
                getLoaders(SpinKitRotatingCircle(color: Colors.white,)),
                getLoaders(SpinKitRipple(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitSpinningCircle(color: Colors.white,)),
                getLoaders(SpinKitSpinningLines(color: Colors.white,)),
                getLoaders(SpinKitSquareCircle(color: Colors.white,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getLoaders(SpinKitThreeBounce(color: Colors.white,)),
                getLoaders(SpinKitWanderingCubes(color: Colors.white,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget getLoaders (widget) {
    return Container(
      margin: EdgeInsets.all(10),
      child: widget,
    );
  }
}
