import 'package:flutter/material.dart';

class NataPage extends StatefulWidget {
  const NataPage({Key? key}) : super(key: key);

  @override
  State<NataPage> createState() => _NataPageState();
}

class _NataPageState extends State<NataPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("NATA"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("NATA 2023"),
        ),
      ),
    );
  }
}
