import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:demo/college_details.dart';
import 'package:demo/college_model.dart';
import 'package:demo/database.dart';
import 'package:demo/main.dart';
import 'package:demo/splash_screen.dart';
import 'package:demo/update_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CollegeList extends StatefulWidget {
  const CollegeList({Key? key}) : super(key: key);

  @override
  State<CollegeList> createState() => _CollegeListState();
}

class _CollegeListState extends State<CollegeList> {
  ArchitectureDatabase db = ArchitectureDatabase();
  List<ArchitectureCollegeModel> localList = [];
  List<ArchitectureCollegeModel> searchList = [];
  Map<String, dynamic> data = {};
  bool isDatabaseUpdate = false;

  @override
  void initState() {
    super.initState();
    ArchitectureDatabase().copyPasteAssetFileToRoot().then((value) {
      ArchitectureDatabase().getArchitectureCollegeList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("College")),
      body: FutureBuilder<List<ArchitectureCollegeModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            localList.clear();
            searchList.clear();
            localList.addAll(snapshot.data!);
            searchList.addAll(localList);
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CollegeDetailsPage(
                            clgDetailsMap: searchList[index],
                          );
                        },
                      ),
                    );
                  },
                  title: Text(searchList[index]
                      .collegeShortName
                      .toString()),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "\u20B9  ${searchList[index].fees.toString()}",
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Seats : ${searchList[index].totalIntake.toString()}",
                        ),
                      ),
                    ],
                  ),
                  shape: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              itemCount: searchList.length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        future: db.getArchitectureCollegeList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.update,
          size: 30,
          color: Colors.black,
        ),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              UpdateDatabase().getQueries();
              Future.delayed(const Duration(seconds: 15), () {
                Navigator.of(context).pop(true);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SplashScreenPage(),
                ));
                print('database updated...');
              });
              return AlertDialog(
                backgroundColor: Colors.black,
                title: Container(
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Architecture 2023",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                titlePadding: const EdgeInsets.all(0),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "It will take 2 to 3 minutes.",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Database Updating....",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            },
          );
          showDialog(
            context: context,
            builder: (context) {
              Future.delayed(
                Duration(seconds: 14),
                () {
                  Navigator.of(context).pop();
                },
              );
              return AlertDialog(
                content: Row(
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.purpleAccent,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text('Database Updating...'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


