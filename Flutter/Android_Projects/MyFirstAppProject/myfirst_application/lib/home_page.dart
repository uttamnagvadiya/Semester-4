import 'package:flutter/material.dart';

class home_page extends StatefulWidget{
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My First Application",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.deepOrange,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white54,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.purpleAccent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.pink,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.tealAccent,
                    ),
                    flex: 2,
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