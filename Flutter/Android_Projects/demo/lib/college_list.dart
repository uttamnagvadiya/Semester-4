import 'dart:convert';

import 'package:demo/college_details.dart';
import 'package:demo/college_model.dart';
import 'package:demo/database.dart';
import 'package:demo/update_database.dart';
import 'package:flutter/material.dart';

class CollegeList extends StatefulWidget {
  const CollegeList({Key? key}) : super(key: key);

  @override
  State<CollegeList> createState() => _CollegeListState();
}

class _CollegeListState extends State<CollegeList> {
  ArchitectureDatabase db = ArchitectureDatabase();
  List<ArchitectureCollegeModel> localList = [];
  List<ArchitectureCollegeModel> searchList = [];
  List<dynamic> data = [];

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
            // localList.clear();
            // searchList.clear();
            // localList.addAll(snapshot.data!);
            // searchList.addAll(localList);
            // return ListView.builder(
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       onTap: () {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) {
            //               return CollegeDetailsPage(
            //                 clgDetailsMap: searchList[index],
            //               );
            //             },
            //           ),
            //         );
            //       },
            //       title: Text(searchList[index]
            //           .collegeShortName
            //           .toString()),
            //       subtitle: Row(
            //         children: [
            //           Expanded(
            //             child: Text(
            //               "\u20B9  ${searchList[index].fees.toString()}",
            //             ),
            //           ),
            //           Expanded(
            //             child: Text(
            //               "Seats : ${searchList[index].totalIntake.toString()}",
            //             ),
            //           ),
            //         ],
            //       ),
            //       shape: const UnderlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.grey,
            //         ),
            //       ),
            //     );
            //   },
            //   itemCount: searchList.length,
            // );
            return Text(
              "Answer: $data",
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
          // UpdateDatabase().getQuerys().then((value) {
          //   data.addAll(value);
          //   setState(() {
          //     data=value;
          //   });
          // },);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Demo(),
          ));
        },
      ),
    );
  }
}
