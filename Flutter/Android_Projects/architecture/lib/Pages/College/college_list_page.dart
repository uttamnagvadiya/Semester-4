import 'package:flutter/material.dart';

class CollegeListPage extends StatefulWidget {
  const CollegeListPage({Key? key}) : super(key: key);

  @override
  State<CollegeListPage> createState() => _CollegeListPageState();
}

class _CollegeListPageState extends State<CollegeListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Colleges"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("List of Colleges"),
        ),
      ),
    );
  }
}
