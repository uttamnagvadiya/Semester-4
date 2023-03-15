import 'package:flutter/material.dart';

class ArchitectureCollegesPage extends StatefulWidget {
  ArchitectureCollegesPage({super.key, required this.rank, required this.category, required this.clgType, required this.board});

  int rank;
  String category;
  String clgType;
  String board;

  @override
  State<ArchitectureCollegesPage> createState() => _ArchitectureCollegesPageState();
}

class _ArchitectureCollegesPageState extends State<ArchitectureCollegesPage> {

  //region Variable Declaration
  //endregion

  @override
  Widget build(BuildContext context) {
    if (widget.category == 'OPEN'){
      widget.category = 'OpenClosingRank';
    }
    else if (widget.category == 'SEBC') {
      widget.category = 'SebcClosingRank';
    }
    else if (widget.category == 'SC') {
      widget.category = 'SCClosingRank';
    }
    else{
      widget.category = 'STClosingRank';
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Architecture Colleges Found"),
          backgroundColor: const Color(0xFFAB00AB),
          automaticallyImplyLeading: false,
        ),
        body:Center(
          child: Text("CLG"),
        ),
      ),
    );
  }
}
