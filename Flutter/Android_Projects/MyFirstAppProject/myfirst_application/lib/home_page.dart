import 'package:flutter/material.dart';
import 'package:myfirst_application/Custom%20Fonts/custom_fonts.dart';
import 'package:myfirst_application/Parts/first.dart';
import 'package:myfirst_application/Screens/home.dart';
import 'package:myfirst_application/Text%20Fields/text_fields.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Column(
            children: [
              makeCard(label: "Parts", navigateRoute: First()),
              makeCard(label: "Screens", navigateRoute: Home()),
              makeCard(label: "Custom Fonts", navigateRoute: CustomFonts()),
              makeCard(label: "Text Field",  navigateRoute: TextFields()),
              makeCard(label: "Pop Up Boxes"),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeCard({label, navigateRoute}) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Card(
              color: Colors.black45,
              margin: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(label,
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => navigateRoute,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
