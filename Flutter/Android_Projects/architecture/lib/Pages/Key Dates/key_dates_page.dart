import 'package:flutter/material.dart';

class KeyDatesPage extends StatefulWidget {
  const KeyDatesPage({Key? key}) : super(key: key);

  @override
  State<KeyDatesPage> createState() => _KeyDatesPageState();
}

class _KeyDatesPageState extends State<KeyDatesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Key Dates"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("Key Dates"),
        ),
      ),
    );
  }
}
