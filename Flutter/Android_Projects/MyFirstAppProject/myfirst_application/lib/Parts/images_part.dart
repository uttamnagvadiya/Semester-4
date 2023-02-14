import 'package:flutter/material.dart';

class PartsWithImages extends StatefulWidget {
  @override
  State<PartsWithImages> createState() => _PartsWithImagesState();
}

class _PartsWithImagesState extends State<PartsWithImages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                          child: Container(
                            child: Image.asset("assets/images/utam.jpg",
                                fit: BoxFit.cover
                            ),
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          )
                      ),
                      Expanded(
                        flex: 2,
                          child: Container(
                            child: Image.asset("assets/images/utam.jpg",
                                fit: BoxFit.cover
                            ),
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            margin: EdgeInsets.all(5),
                            color: Colors.lightGreen,
                          )
                      ),
                      Expanded(
                          child: Container(
                            child: Image.asset("assets/images/utam.jpg",
                                fit: BoxFit.cover
                            ),
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            margin: EdgeInsets.all(5),
                            color: Colors.cyan,
                          )
                      ),
                    ],
                  )
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex:3,
                                          child: Container(
                                            child: Image.asset("assets/images/utam.jpg",
                                                fit: BoxFit.cover
                                            ),
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.all(5),
                                            color: Colors.blueAccent,
                                          )
                                      ),
                                      Expanded(
                                          child: Container(
                                            child: Image.asset("assets/images/utam.jpg",
                                                fit: BoxFit.cover
                                            ),
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.all(5),
                                            color: Colors.black,
                                          )
                                      ),
                                    ],
                                  )
                              ),
                              Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                          child: Container(
                                            child: Image.asset("assets/images/utam.jpg",
                                                fit: BoxFit.cover
                                            ),
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.all(5),
                                            color: Colors.blueAccent,
                                          )
                                      ),
                                      Expanded(
                                          child: Container(
                                            child: Image.asset("assets/images/utam.jpg",
                                                fit: BoxFit.fill
                                            ),
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.all(5),
                                            color: Colors.black,
                                          )
                                      ),
                                    ],
                                  )
                              )
                            ],
                          )
                      ),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  child: Container(
                                    child: Image.asset("assets/images/utam.jpg",
                                        fit: BoxFit.fill
                                    ),
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.all(5),
                                    color: Colors.purpleAccent,
                                  )
                              ),
                              Expanded(
                                  child: Container(
                                    child: Image.asset("assets/images/utam.jpg",
                                    fit: BoxFit.fill),
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.all(5),
                                    color: Colors.teal,
                                  )
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}