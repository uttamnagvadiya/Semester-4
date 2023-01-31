import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My First Application",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                    ),
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
                  Expanded(
                    child: Container(
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              child: Row(
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.purpleAccent,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      color: Colors.white54,
                    ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.greenAccent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.lightGreenAccent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              child: Row()
                          ),
                        ],
                      ),
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  color: Colors.pink,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  color: Colors.lightGreenAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      color: Colors.tealAccent,
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