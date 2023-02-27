import 'package:flutter/material.dart';

class CyberCentersPage extends StatefulWidget {
  const CyberCentersPage({Key? key}) : super(key: key);

  @override
  State<CyberCentersPage> createState() => _CyberCentersPageState();
}

class _CyberCentersPageState extends State<CyberCentersPage> {
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
          child: Text("Centers"),
        ),
      ),
    );
  }
}
