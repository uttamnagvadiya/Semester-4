import 'package:flutter/material.dart';

class CollegeDetailsPage extends StatefulWidget {
  const CollegeDetailsPage({Key? key}) : super(key: key);

  @override
  State<CollegeDetailsPage> createState() => _CollegeDetailsPageState();
}

class _CollegeDetailsPageState extends State<CollegeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("College Name"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("Details of College"),
        ),
      ),
    );
  }
}
