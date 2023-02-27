import 'package:flutter/material.dart';

class CyberCentersCityPage extends StatefulWidget {
  const CyberCentersCityPage({Key? key}) : super(key: key);

  @override
  State<CyberCentersCityPage> createState() => _CyberCentersCityPageState();
}

class _CyberCentersCityPageState extends State<CyberCentersCityPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cyber Centers"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("Cyber Center Cities"),
        ),
      ),
    );
  }
}
