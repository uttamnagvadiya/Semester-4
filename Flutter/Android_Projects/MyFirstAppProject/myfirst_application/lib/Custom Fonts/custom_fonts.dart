import 'package:flutter/material.dart';

class CustomFonts extends StatefulWidget {
  const CustomFonts({Key? key}) : super(key: key);

  @override
  State<CustomFonts> createState() => _CustomFontsState();
}

class _CustomFontsState extends State<CustomFonts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Custom Fonts"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(fontFamily: "Pacifico"),
              customText(fontFamily: "Akronim"),
              customText(fontFamily: "Tourney"),
              customText(fontFamily: "Julee"),
              customText(fontFamily: "Monofett"),
            ],
          ),
        ),
      ),
    );
  }

  Widget customText ({fontFamily}) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text("Hello World", style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: fontFamily),),
    );
  }
}
