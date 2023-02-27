import 'package:flutter/material.dart';

class CyberCenterDetailsPage extends StatefulWidget {
  const CyberCenterDetailsPage({Key? key}) : super(key: key);

  @override
  State<CyberCenterDetailsPage> createState() => _CyberCenterDetailsPageState();
}

class _CyberCenterDetailsPageState extends State<CyberCenterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Center Details"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("Details"),
        ),
      ),
    );
  }
}
