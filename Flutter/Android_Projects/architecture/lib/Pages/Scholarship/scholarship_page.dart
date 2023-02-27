import 'package:flutter/material.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({Key? key}) : super(key: key);

  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Scholarship"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("Scholarship"),
        ),
      ),
    );
  }
}
