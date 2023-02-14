import 'package:flutter/material.dart';
import 'package:myfirst_application/Parts/images_part.dart';
import 'package:myfirst_application/Parts/parts.dart';
import 'package:myfirst_application/Parts/simple_interest.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Tab 1",
              ),
              Tab(
                text: "Tab 2",
              ),
              Tab(
                text: "Tab 3",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Parts(),
            PartsWithImages(),
            SimpleInterest(),
          ],
        ),
      ),
    );
  }
}
