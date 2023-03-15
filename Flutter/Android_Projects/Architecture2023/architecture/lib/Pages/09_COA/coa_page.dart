import 'package:flutter/material.dart';

class COAPage extends StatefulWidget {
  const COAPage({Key? key}) : super(key: key);

  @override
  State<COAPage> createState() => _COAPageState();
}

class _COAPageState extends State<COAPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("COA"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("Council of Architecture (COA)"),
        ),
      ),
    );
  }
}
